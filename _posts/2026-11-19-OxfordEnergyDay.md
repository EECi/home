---
layout: single
title: EECinsights - A clean sweep at Oxford Energy Day 2026
last_modified_at: 2026-11-19
author: "Monty"
author_profile: true
read_time: true
comments: true
share: true
related: true
excerpt: "Three posters, three first prizes."
---

<div class="textRow">
  <div class="textBlock">
    In September, I headed over to the other place for the <a href="https://www.energy.ox.ac.uk/events/event/14th-oxford-energy-day-2026-towards-resilient-energy-systems-research-policy-and-practice/">14th Oxford Energy Day</a>, joined by two of our MPhil students, Christian and Leo. This year's theme was <em>Towards resilient energy systems: research, policy and practice</em>, and the day brought together researchers from across Oxford working on everything from energy technologies and economics to energy security, governance, and what resilience means for households and businesses. We went along to present our own research and to hear what Oxford has been working on.
  </div>
</div>

<div class="imageTextRow row-reverse">
  <div class="textBlock">
    My poster, <em>Organised for continuity, not for net zero</em>, looked at how retrofit decisions are made in NHS hospital estates. Acute hospitals are built to absorb disruption, and the logic that keeps clinical services running is the same logic that shapes how capital gets spent. Drawing on 18 interviews across a large, well-run acute hospital estate with a backlog of over £200m, the poster set out the decision hierarchy, three structural blockers to decarbonisation, and how two retrofit projects took very different routes to very different outcomes. It fitted the resilience theme well, since the question is less about whether estates value resilience and more about which kind of resilience wins out.
  </div>
  <div class="imageWrapper">
    <a href="{{ '/Images/EECinsights/OED2026-Monty-poster.jpg' | relative_url }}" target="_blank">
      <img src="{{ '/Images/EECinsights/OED2026-Monty-poster.jpg' | relative_url }}" alt="Monty's poster: Organised for continuity, not for net zero" />
    </a>
    <div class="imageCaption">Organised for continuity, not for net zero</div>
  </div>
</div>

<div class="imageTextRow">
  <div class="textBlock">
    Leo's poster, <em>The UK's opportunity for demand response has almost doubled</em>, combined national Time Use Survey data from 2000 to 2025 with smart meter data to ask a simple question: are people actually home and awake for long enough to shift their electricity use? His answer is that this availability has almost doubled since 2000, from 16% to 30%, driven largely by the growth in home working. He also showed that the new flexibility is not spread evenly: higher-income adults gained 23 points while retired adults and lower-income women saw little or no change, which matters if demand response is going to be fair as well as effective.
  </div>
  <div class="imageWrapper">
    <a href="{{ '/Images/EECinsights/OED2026-Leo-poster.jpg' | relative_url }}" target="_blank">
      <img src="{{ '/Images/EECinsights/OED2026-Leo-poster.jpg' | relative_url }}" alt="Leo's poster: The UK's opportunity for demand response has almost doubled" />
    </a>
    <div class="imageCaption">The UK's opportunity for demand response has almost doubled</div>
  </div>
</div>

<div class="imageTextRow row-reverse">
  <div class="textBlock">
    Christian's poster, <em>More air or better airflow?</em>, explored a resilient ventilation retrofit for a four-bed ward in the Old Rosie Maternity Hospital at Addenbrooke's. Linking a calibrated EnergyPlus model of the building to computational fluid dynamics of the patient breathing zone, he compared simply supplying more air against changing where the air is extracted. His headline finding: more air helped, but better airflow helped much more. Tripling the supply flow cut worst-case bystander exposure by 55.5%, while extracting air close to the source, at the existing flow rate, cut it by 89.6% and supported a window-control scenario modelled to save around 31 MWh a year.
  </div>
  <div class="imageWrapper">
    <a href="{{ '/Images/EECinsights/OED2026-Christian-poster.jpg' | relative_url }}" target="_blank">
      <img src="{{ '/Images/EECinsights/OED2026-Christian-poster.jpg' | relative_url }}" alt="Christian's poster: More air or better airflow?" />
    </a>
    <div class="imageCaption">More air or better airflow?</div>
  </div>
</div>

<div class="textRow">
  <div class="textBlock">
    Somehow, when the poster prizes were announced at the end of the day, we came away with a clean sweep of first prizes: Christian for <strong>Communication of data</strong>, Leo for <strong>Most promising research for the energy transition</strong>, and me for <strong>Visual design</strong>. A huge congratulations to Christian and Leo, and thank you to Oxford Energy and the poster jury, chaired by Dr Marina Topouzi, for a brilliant day. EECi will be back next year to defend our titles.
  </div>
</div>

<div class="wideImage">
  <a href="{{ '/Images/EECinsights/OED2026-certificates.jpg' | relative_url }}" target="_blank">
    <img src="{{ '/Images/EECinsights/OED2026-certificates.jpg' | relative_url }}" alt="Three first prize certificates for best poster display" />
  </a>
  <div class="imageCaption">Three for three</div>
</div>

<style>
.textRow {
  margin-bottom: 2em;
}

.wideImage {
  margin-bottom: 2em;
  text-align: center;
}

.wideImage img {
  width: 100%;
  height: auto;
  display: block;
}
/* Default desktop styles */
.imageTextRow {
  display: flex;
  align-items: center;
  gap: 1em;
  margin-bottom: 2em;
  flex-wrap: wrap;
}

.row-reverse {
  flex-direction: row-reverse;
}

.imageWrapper {
  flex: 1;
  position: relative;
  text-align: center;
  min-width: 200px;
}

.imageWrapper img {
  max-height: 275px;
  height: auto;
  width: auto;
  max-width: 100%;
  display: block;
  margin: 0 auto;
}

.imageCaption {
  font-size: 0.9em;
  text-align: center;
  margin-top: 0.3em;
}

.textBlock {
  flex: 2;
  min-width: 250px;
}

/* Responsive overrides for screens smaller than 768px */
@media (max-width: 768px) {
  .imageTextRow {
    flex-direction: column !important;
    text-align: center;
  }

  .textBlock {
    order: 2;
    width: 100%;
  }

  .imageWrapper {
    order: 1;
    width: 100%;
  }

  .imageWrapper img {
    max-height: none;
    width: 100%;
    height: auto;
  }
}
</style>
