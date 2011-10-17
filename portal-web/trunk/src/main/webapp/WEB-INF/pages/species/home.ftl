<html>
<head>
  <title>Species Search</title>
  <meta name="menu" content="species"/>
</head>
<body class="dataset">

  <article class="dataset">
    <header></header>
    <div class="content">
      <h1>Search through 2,183,212 species</h1>

      <form action="<@s.url value='/species/search'/>">
        <span class="input_text">
          <input type="text" name="q" placeholder="Search species by name, higher taxon, place..."/>
        </span>
        <button type="submit" class="search_button"><span>Search</span></button>
      </form>
      <ul class="species">
        <li><a href="<@s.url value='/species/search?q=fake'/>" title="Birds">Birds</a></li>
        <li><a href="<@s.url value='/species/search?q=fake'/>" title="Butterflies">Butterflies</a></li>
        <li><a href="<@s.url value='/species/search?q=fake'/>" title="Lizards">Lizards</a></li>
        <li><a href="<@s.url value='/species/search?q=fake'/>" title="Reptiles">Reptiles</a></li>
        <li><a href="<@s.url value='/species/search?q=fake'/>" title="Fishes">Fishes</a></li>
        <li><a href="<@s.url value='/species/search?q=fake'/>" title="Mammals">Mammals</a></li>
        <li><a href="<@s.url value='/species/search?q=fake'/>" title="Insects">Insects</a></li>
      </ul>
      <div class="results">
        <ul>
          <li><a href="<@s.url value='/species/search?q=fake'/>" title="">2,183,212</a>total species</li>
          <li><a href="<@s.url value='/species/search?q=fake'/>" title="">1,291,282</a>total infraspecific</li>
          <li class="last"><a href="#">13,121,251</a>common names in 41 languages</li>
        </ul>
      </div>
    </div>
    <footer></footer>
  </article>
  <p class="advice">Looking for something more specific? Use our <a href="#" title="advance filtering">advanced
    filtering</a> or the <a href="#" title="taxonomic browser">taxonomic browser</a>.</p>


</body>
</html>
