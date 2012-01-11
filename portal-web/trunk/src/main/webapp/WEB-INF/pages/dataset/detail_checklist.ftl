<#import "/WEB-INF/macros/common.ftl" as common>
<html>
<head>
  <title>${dataset.title} - Checklist dataset detail</title>
  <content tag="extra_scripts">
    <script type="text/javascript" src="<@s.url value='/js/vendor/OpenLayers.js'/>"></script>
    <script type="text/javascript" src="<@s.url value='/js/openlayers_addons.js'/>"></script>
    <script type="text/javascript" src="<@s.url value='/js/Infowindow.js'/>"></script>
    <script type="text/javascript" src="<@s.url value='/js/types_map.js'/>"></script>
    <script type="text/javascript" src="<@s.url value='/js/single_map.js'/>"></script>
  </content>
  <meta name="menu" content="datasets"/>
</head>
<body class="typesmap">

<#assign tab="info"/>
<#include "/WEB-INF/pages/dataset/infoband.ftl">

<article>
  <header></header>
  <div class="content">

    <#include "/WEB-INF/pages/dataset/summary.ftl">

    <#include "/WEB-INF/pages/dataset/right_sidebar.ftl">

  </div>
  <footer></footer>
</article>

<article>
  <header></header>
  <div class="content">

    <div class="header">
      <div class="left"><h2>Checklist preview</h2></div>
    </div>

    <div class="left">
      <ul class="three_cols">
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Araneae<a/></li>
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Opiliones</a></li>
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Parasitiformes</a></li>
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Pseudoscorpionida</a></li>
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Sarcoptiformes</a></li>
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Scorpiones</a></li>
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Trombidiformes</a></li>
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Pseudoscorpionida</a></li>
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Sarcoptiformes</a></li>
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Scorpiones</a></li>
      </ul>
      <ul class="three_cols">
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Araneae<a/></li>
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Opiliones</a></li>
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Parasitiformes</a></li>
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Pseudoscorpionida</a></li>
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Sarcoptiformes</a></li>
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Scorpiones</a></li>
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Trombidiformes</a></li>
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Pseudoscorpionida</a></li>
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Sarcoptiformes</a></li>
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Scorpiones</a></li>
      </ul>
      <ul class="three_cols">
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Araneae<a/></li>
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Opiliones</a></li>
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Parasitiformes</a></li>
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Pseudoscorpionida</a></li>
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Sarcoptiformes</a></li>
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Scorpiones</a></li>
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Trombidiformes</a></li>
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Pseudoscorpionida</a></li>
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Sarcoptiformes</a></li>
        <li><a href="<@s.url value='/species/42/name_usage'/>" class="placeholder_temp">Scorpiones</a></li>
      </ul>

      <p>The complete list has XXX more elements. You can <a href="#" class="download"
                                                             title="Download all the elments">download them all</a>.
      </p>
    </div>

    <div class="right">
      <h3>Taxonomic coverage</h3>

      <p class="placeholder_temp">Animalia</p>

      <h3>Second level data elements</h3>
      <ul>
        <li>References <span class="number placeholder_temp">123</span></li>
        <li>Common names <span class="number placeholder_temp">456</span></li>
        <li>Specimens <span class="number placeholder_temp">152</span></li>
      </ul>
    </div>
  </div>
  <footer></footer>
</article>

<article class="map">
  <header></header>
  <div id="map"></div>
  <a href="#zoom_in" class="zoom_in"></a>
  <a href="#zoom_out" class="zoom_out"></a>

  <div class="content">

    <div class="header">
      <div class="right"><h2>Boundaries</h2></div>
    </div>

    <div class="right">
      <h3>Geographic coverage</h3>

      <p class="placeholder_temp">North America</p>

      <p class="maptype"><a href="#" title="points" class="placeholder_temp">points</a> | <a href="#" title="grid"
                                                                                             class="placeholder_temp">grid</a>
        | <a href="#"
             title="polygons"
             class="selected placeholder_temp">polygons</a>
      </p>

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

<article>
  <header></header>
  <div class="content">
    <h2>The project</h2>

    <div class="left">

      <h3>Study area description</h3>

      <p class="placeholder_temp">Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie
        consequat, vel illum dolore eu
        feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril
        delenit augue duis dolore te feugait nulla facilisi. Dolore eu feugiat nulla facilisis at vero eros et
        accumsan et iusto odio dignissim qui blandit.</p>

      <h3>Design description</h3>

      <p class="placeholder_temp">Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie
        consequat, vel illum dolore eu
        feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril
        delenit augue duis dolore te feugait nulla facilisi. Dolore eu feugiat nulla facilisis at vero eros et accumsan
        et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla
        facilisi.</p>

      <h3>Funding</h3>

      <p class="placeholder_temp">Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie
        consequat, vel illum dolore eu
        feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril
        delenit augue duis dolore te feugait nulla facilisi.</p>

      <h3>Team</h3>

      <ul class="team">
        <li class="placeholder_temp">
          <h4 class="placeholder_temp">Paul J. Morris</h4>
          <h4 class="position placeholder_temp">Resource Contact</h4>
          <a href="#" title="Paul J. Morris' email" class="placeholder_temp">mole@morris.net</a>
          1-215-299-1161
        </li>

        <li class="placeholder_temp">
          <h4 class="placeholder_temp">Markus Doring</h4>
          <h4 class="position placeholder_temp">Taxonomy</h4>
          <a href="#" title="Markus doring's email" class="placeholder_temp">mdoring@morris.net</a>
          1-215-299-1161
        </li>

        <li class="placeholder_temp">
          <h4 class="placeholder_temp">Javier Álvarez</h4>
          <h4 class="position placeholder_temp">Resource Contact</h4>
          <a href="#" title="Javier Álvarez email" class="placeholder_temp">javieralvarez@morris.net</a>
          <span class="phone">1-215-299-1161</span>
        </li>

      </ul>
    </div>

    <div class="right">
      <h3>ASSOCIATED PARTIES</h3>

      <ul class="team vertical">
        <li class="placeholder_temp">
          <h4 class="placeholder_temp">David Remsen</h4>
          <h4 class="position placeholder_temp">GBIF Secretariat</h4>

          Universitetsparken 15, Copenhagen, Ø, Denmark
          <a href="#" title="David Remsen' email" class="placeholder_temp">dremsen@gbif.org</a>
          004535321472
        </li>

        <li class="placeholder_temp">
          <h4 class="placeholder_temp">Javier de la Torre</h4>
          <h4 class="position placeholder_temp">GBIF Spain Node</h4>
          <a href="#" title="Javier de la Torre's email" class="placeholder_temp">jatorre@gbif.org</a>
          659888888
        </li>

      </ul>
    </div>
  </div>
  <footer></footer>
</article>

<article>
  <header></header>
  <div class="content">
    <h2>Methodology</h2>

    <div class="left">

      <h3>Study extent</h3>

      <p class="placeholder_temp">Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie
        consequat, vel illum dolore eu
        feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril
        delenit augue duis dolore te feugait nulla facilisi. Dolore eu feugiat nulla facilisis at vero eros et
        accumsan et iusto odio dignissim qui blandit.</p>

      <h3>Sampling description</h3>

      <p class="placeholder_temp">Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie
        consequat, vel illum dolore eu
        feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril
        delenit augue duis dolore te feugait nulla facilisi. Dolore eu feugiat nulla facilisis at vero eros et accumsan
        et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla
        facilisi.</p>

      <h3>Quality control</h3>

      <p class="placeholder_temp">Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie
        consequat, vel illum dolore eu
        feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril
        delenit augue duis dolore te feugait nulla facilisi.</p>

    </div>

    <div class="right">
      <h3>Collection name</h3>

      <p class="placeholder_temp">Ave specimens (AVES123)</p>

      <h3>Parent identifier</h3>

      <p class="placeholder_temp">AVES</p>

      <h3>Preservation method</h3>

      <p class="placeholder_temp">Glycerin</p>

      <h3>Curational units</h3>
      <ul>
        <li class="placeholder_temp">100/500 Specimens</li>
        <li class="placeholder_temp">1000 (+/- 100) jars</li>
        <li class="placeholder_temp">100/500 Boxes</li>
      </ul>
    </div>

  </div>
  <footer></footer>
</article>


<article class="mono_line">
  <header></header>
  <div class="content">

    <div class="header">
      <h2>Dataset usage & legal issues</h2>
    </div>

    <div class="left">
      <h3>Usage rights</h3>

      <p class="placeholder_temp">This dataset is released under an Open Data licence, so it can be used to anyone who
        cites it. </p>

      <h3>How to cite it</h3>

      <p class="placeholder_temp">Alaska Ocean Observing System, Arctic Ocean Diversity (accessed through GBIF data
        portal, <a href="#"
                   title="Alaska Ocean Observing System, Arctic Ocean Diversity">http://data.gbif.org/datasets/resource/654</a>,
        2011-05-05)</p>
    </div>

  </div>
  <footer></footer>
</article>

</body>
</html>
