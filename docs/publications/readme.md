# Publications

The file EECi_bib.bib contains all the publications produced by the group.

Please add any papers you publish to this file.

To link to this file on individual people pages use the following text (replace 'Ward' with your own name):

```html
<div>
<script src="https://bibbase.org/show?bib=https%3A%2F%2Fraw.githubusercontent.com%2FEECi%2Fhome%2Fmain%2Fdocs%2Fpublications%2FEECi_bib.bib&commas=true&jsonp=1&amp;filter=author_short:Ward&amp;folding=1"></script> 
</div>
```

This is the recommended usage. You can place your own personal bib file in this directory if you wish to list your previous publications.

## Automatic updates from ORCID

Add your ORCID iD to your entry in `_data/authors.yml`:

```yaml
Monty:
  name: "Monty Jackson"
  orcid: "https://orcid.org/0009-0009-7842-2880"
```

Every Monday, the GitHub Action `.github/workflows/update-publications.yml` runs `scripts/update_publications.py`. It reads your public ORCID works and adds any paper with a DOI that is not yet in `docs/publications/<yourname>.bib`, getting the BibTeX from doi.org. Existing entries are never changed or removed, so you can still add or edit entries by hand. You can also start the action manually from the Actions tab on GitHub.

Then embed your file on your people page:

```html
<script src="https://bibbase.org/show?bib=https%3A%2F%2Fraw.githubusercontent.com%2FEECi%2Fhome%2Fmain%2Fdocs%2Fpublications%2Fyourname.bib&commas=true&jsonp=1&folding=1"></script>
```

Only works with a DOI on ORCID are picked up, so keep your ORCID record up to date.
