---
layout: home
title: Recent posts
header:
  image: /Images/Group Logo.png
  caption: "Photo credit: [**Unsplash**](https://unsplash.com)"
---


This page contains the latest posts by our team.

<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>