---
layout: home
title: Recent posts
header:
  image: /Images/Group Logo.png
  caption: "Photo credit: [**Unsplash**](https://unsplash.com)"
---


Here you can find our blog with data visualisations, quick insights, and hot takes from our ongoing work.

<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>
