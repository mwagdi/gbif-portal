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

      <form action="<@s.url value='/species/search'/>" method="GET">
        <span class="input_text">
          <input id="q" type="text" name="q" placeholder="Search species by name, higher taxon, place..."/>
        </span>
        <button id="submitSearch" type="submit" class="search_button"><span>Search</span></button>
      </form>
      <ul class="species">
        <li><a href="<@s.url value='/species/search?q=Mammalia'/>" title="Mammals">Mammals</a></li>
        <li><a href="<@s.url value='/species/search?q=Aves'/>" title="Birds">Birds</a></li>
        <li><a href="<@s.url value='/species/search?q=Insecta'/>" title="Insects">Insects</a></li>
        <li><a href="<@s.url value='/species/search?q=Reptilia'/>" title="Reptiles">Reptiles</a></li>
        <#--
         see http://en.wikipedia.org/wiki/Fish#Taxonomy
         MISSING FROM THESE FISH FILTERS ARE THE FOLLOWING, WHICH ARE NOT IN COL:
          - Placodermi

        -->
        <li><a href="<@s.url value='/species/search?highertaxon=119&highertaxon=120&highertaxon=121&highertaxon=204&highertaxon=238&highertaxon=239&highertaxon=4853178&highertaxon=3238258&highertaxon=4836892&highertaxon=4815623'/>" title="Fishes">Fishes</a></li>
        <li><a href="<@s.url value='/species/search?q=Lepidoptera'/>" title="Butterflies">Butterflies</a></li>
        <li><a href="<@s.url value='/species/search?q=Fungi'/>" title="Lizards">Fungi</a></li>
        <li><a href="<@s.url value='/species/search?q=Magnoliophyta'/>" title="Lizards">Flowering Plants</a></li>
      </ul>
      <div class="results">
        <ul>
          <li><a href="<@s.url value='/species/search?rank=species'/>" title="">2,183,212</a>total species</li>
          <li><a href="<@s.url value='/species/search?&rank=infraspecific_name&rank=subspecies&rank=infrasubspecific_name&rank=variety&rank=subvariety&rank=form&rank=subform&rank=cultivar_group&rank=cultivar'/>" title="">1,291,282</a>total infraspecific</li>
          <li class="last"><a href="<@s.url value='/species/search'/>">13,121,251</a>common names in 41 languages</li>
        </ul>
      </div>
    </div>
    <footer></footer>
  </article>
  <p class="advice">Looking for something more specific? Use our <a href="#" title="advance filtering">advanced
    filtering</a> or the <a href="#" title="taxonomic browser">taxonomic browser</a>.</p>


</body>
</html>
