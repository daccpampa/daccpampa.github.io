---
layout: page
title: Buscar
---

<div id="search-container">
	<input type="text" id="search-input" placeholder="Digite aqui...">
	<ol id="results-container"></ol>
</div>
<script src="{{ site.baseurl }}/assets/js/search-script.min.js" type="text/javascript"></script>

<!-- Configuration -->
<script type="text/javascript">
SimpleJekyllSearch({
  searchInput: document.getElementById('search-input'),
  resultsContainer: document.getElementById('results-container'),
  json: '{{ site.baseurl }}/search.json',
  searchResultTemplate: '<li><a href="{url}" title="{description}">{title}</a></li>',
  noResultsText: 'Nenhum resultado encontrado!',
  limit: 10,
  fuzzy: false,
  exclude: ['Welcome']
})
</script>
