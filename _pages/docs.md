---
layout: page
title: Documentos
---

<section class="posts">
<ul>
{% for doc in site.docs reversed %}
<li><a href="{{ site.baseurl }}{{ doc.url }}">{{ doc.title }}</a><time datetime="{{ doc.date | date_to_xmlschema }}">{{ doc.date | date: "%d-%m-%Y" }}</time></li>
{% endfor %}
</ul>
</section>
