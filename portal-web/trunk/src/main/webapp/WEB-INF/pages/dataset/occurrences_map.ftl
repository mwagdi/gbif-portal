<content tag="extra_scripts">
  <link rel="stylesheet" href="<@s.url value='/js/vendor/leaflet/leaflet.css'/>" />
  <!--[if lte IE 8]><link rel="stylesheet" href="<@s.url value='/js/vendor/leaflet/leaflet.ie.css'/>" /><![endif]-->
  <script type="text/javascript" src="<@s.url value='/js/vendor/leaflet/leaflet.js'/>"></script>
  <script type="text/javascript" src="<@s.url value='/js/map.js'/>"></script>
</content>

<article class="map">
  <header></header>

  <div class="map_container">
    <a href="#zoom_in"  class="zoom_in"></a>
    <a href="#zoom_out" class="zoom_out"></a>

    <div id="map" type="DATASET" key="${dataset.key}"></div>
  </div>
  
  <div class="content">

    <div class="header">
      <div class="right"><h2>${(metrics.countGeoreferenced)!"Unkown"} georeferenced occurrences</h2></div>
    </div>

    <div class="right">
      <h3>Visualize</h3>

      <p class="maptype"><a class="selected" href="#" title="points">points</a> | <a href="#" title="grid">grid</a> | <a
              href="#" title="polygons">polygons</a></p>

      <h3>Download</h3>
      <ul>
        <li class="download"><a href="#" title="One Degree cell density">One Degree cell density <abbr
                title="Keyhole Markup Language">(KML)</abbr></a></li>
        <li class="download"><a href="#" title="Placemarks">Placemarks <abbr
                title="Keyhole Markup Language">(KML)</abbr></a></li>
      </ul>
    </div>
  </div>
  <footer></footer>
</article>
