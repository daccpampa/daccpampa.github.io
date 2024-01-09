---
title: Tags
---

{% assign tags = "" | split: "" %}

{% for doc in site.docs %}
  {% assign tags = tags | concat: doc.tags | uniq %}
{% endfor %}

<p>
  {% for tag in tags %}
    <a href="/tags/{{ tag }}/">
      {{ tag | replace: "-", " " }}
    </a>
    <br>
  {% endfor %}
</p>
