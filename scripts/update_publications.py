"""Sync personal BibTeX files with ORCID.

For every author in _data/authors.yml that has an `orcid:` field, this script:
  1. fetches their public works from the ORCID API,
  2. looks up BibTeX for each DOI via doi.org content negotiation,
  3. appends any paper whose DOI is not already in docs/publications/<key>.bib.

Existing entries are never modified or removed, so hand-edited entries and
papers without a DOI are safe. BibBase reads these files from GitHub, so the
people pages update automatically once the changes are committed.

Optional per-author field `bib:` overrides the file name (default: <key>.bib,
lower-cased author key).

Run locally with:  python scripts/update_publications.py
"""

import json
import re
import sys
import time
import urllib.error
import urllib.request
from pathlib import Path

import yaml

ROOT = Path(__file__).resolve().parent.parent
AUTHORS_FILE = ROOT / "_data" / "authors.yml"
BIB_DIR = ROOT / "docs" / "publications"
USER_AGENT = "EECi-website-publication-sync (+https://github.com/EECi/home)"
ORCID_RE = re.compile(r"(\d{4}-\d{4}-\d{4}-\d{3}[\dX])")
DOI_FIELD_RE = re.compile(r"\bdoi\s*=\s*[{\"]\s*([^}\"]+?)\s*[}\"]", re.IGNORECASE)
KEY_RE = re.compile(r"@\w+\s*\{\s*([^,\s]+)\s*,")


def http_get(url, accept, retries=3):
    req = urllib.request.Request(url, headers={"Accept": accept, "User-Agent": USER_AGENT})
    for attempt in range(retries):
        try:
            with urllib.request.urlopen(req, timeout=30) as resp:
                return resp.read().decode("utf-8")
        except urllib.error.HTTPError as err:
            if err.code == 404:
                raise
            if attempt == retries - 1:
                raise
        except urllib.error.URLError:
            if attempt == retries - 1:
                raise
        time.sleep(2 ** attempt)


def normalise_doi(doi):
    doi = doi.strip().lower()
    doi = re.sub(r"^(https?://)?(dx\.)?doi\.org/", "", doi)
    return re.sub(r"^doi:\s*", "", doi)


def orcid_dois(orcid):
    """Return {doi: title} for the person's public ORCID works."""
    data = json.loads(http_get(f"https://pub.orcid.org/v3.0/{orcid}/works", "application/json"))
    works = {}
    for group in data.get("group", []):
        summary = group["work-summary"][0]
        title = ((summary.get("title") or {}).get("title") or {}).get("value", "(untitled)")
        ids = (group.get("external-ids") or {}).get("external-id", [])
        dois = [i["external-id-value"] for i in ids if i.get("external-id-type") == "doi"]
        if dois:
            works[normalise_doi(dois[0])] = title
        else:
            print(f"    skipped (no DOI on ORCID): {title}")
    return works


def doi_bibtex(doi):
    return http_get(f"https://doi.org/{doi}", "application/x-bibtex; charset=utf-8").strip()


def make_key_unique(entry, existing_keys):
    match = KEY_RE.search(entry)
    if not match:
        return entry
    key = base = match.group(1)
    suffix = ord("a")
    while key in existing_keys:
        key = f"{base}{chr(suffix)}"
        suffix += 1
    existing_keys.add(key)
    return entry[: match.start(1)] + key + entry[match.end(1):]


def sync_author(key, author):
    match = ORCID_RE.search(str(author["orcid"]))
    if not match:
        print(f"  {key}: invalid orcid value {author['orcid']!r}, skipping")
        return False
    orcid = match.group(1)
    bib_path = BIB_DIR / author.get("bib", f"{key.lower()}.bib")
    print(f"  {key} ({orcid}) -> {bib_path.relative_to(ROOT)}")

    text = bib_path.read_text(encoding="utf-8") if bib_path.exists() else ""
    have = {normalise_doi(d) for d in DOI_FIELD_RE.findall(text)}
    keys = set(KEY_RE.findall(text))

    new_entries = []
    for doi, title in orcid_dois(orcid).items():
        if doi in have:
            continue
        try:
            entry = doi_bibtex(doi)
        except Exception as err:  # keep going; try again on the next run
            print(f"    failed to fetch BibTeX for {doi}: {err}")
            continue
        if not entry.startswith("@"):
            print(f"    unexpected response for {doi}, skipping")
            continue
        new_entries.append(make_key_unique(entry, keys))
        print(f"    added: {title}")

    if not new_entries:
        print("    up to date")
        return False

    parts = [text.rstrip()] if text.strip() else []
    parts += new_entries
    bib_path.write_text("\n\n".join(parts) + "\n", encoding="utf-8")
    return True


def main():
    authors = yaml.safe_load(AUTHORS_FILE.read_text(encoding="utf-8"))
    print("Syncing publications from ORCID")
    changed = False
    for key, author in authors.items():
        if isinstance(author, dict) and author.get("orcid"):
            try:
                changed |= sync_author(key, author)
            except Exception as err:
                print(f"  {key}: ORCID lookup failed: {err}")
    print("Done." if changed else "Done, nothing changed.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
