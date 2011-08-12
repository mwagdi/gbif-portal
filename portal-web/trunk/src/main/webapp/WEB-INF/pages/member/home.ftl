<html>
<head>
  <title>Members - GBIF</title>
</head>
<body class="dataset mapfull">

  <div id="map"></div>
  <a class="zoom_in" href="#zoom_in">zoom in</a>
  <a class="zoom_out" href="#zoom_out">zoom out</a>

  <article class="mapfull cluster dataset">
    <header></header>
    <div class="content">
      <h1>Search GBIF Network members</h1>

      <form action="/members/search">
      <span class="input_text">
        <input type="text" name="q" placeholder="Search names,countries..."/>
      </span>
        <button type="submit" class="search_button"><span>Search</span></button>
      </form>
      <div class="results">
        <ul>
          <li><a href="/members/search?q=participant" title="">121</a>participant</li>
          <li><a href="/members/search?q=publisher" title="">654</a>publishers</li>
          <li><a href="/members/search?q=technical" title="">129</a>technical</li>
          <li class="last"><a href="/members/search?q=network" title="">34</a>networks</li>
        </ul>
      </div>
      <p class="explore">...or <a href="#explore">explore the map</a></p>
    </div>
    <footer></footer>
  </article>

</body>
</html>
