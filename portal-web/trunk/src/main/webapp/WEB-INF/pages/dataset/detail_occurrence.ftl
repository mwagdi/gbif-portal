<html>
<head>
  <title>Dataset detail - GBIF</title>
  <content tag="extra_scripts">
    <script type="text/javascript" src="<@s.url value='/js/vendor/OpenLayers.js'/>"></script>
    <script type="text/javascript" src="<@s.url value='/js/openlayers_addons.js'/>"></script>
    <script type="text/javascript" src="<@s.url value='/js/Infowindow.js'/>"></script>
    <script type="text/javascript" src="<@s.url value='/js/types_map.js'/>"></script>
    <script type="text/javascript" src="<@s.url value='/js/single_map.js'/>"></script>
  </content>
  <meta name="menu" content="datasets"/>
</head>
<body class="species typesmap">

<content tag="infoband">
  <ul class="breadcrumb">
    <li class="last"><a href="<@s.url value='/dataset'/>" title="Datasets">Datasets</a></li>
  </ul>

  <h1>World Mangroves Fauna</h1>

  <h3 class="separator">Provided by <a href="<@s.url value='/member/123'/>">Botanic Garden and Botanical Museum
    Berlin-Dahlem</a>
  </h3>
  <ul class="tags">
    <li><a href="#" title="World">World</a></li>
    <li><a href="#" title="coastal">coastal</a></li>
    <li class="last"><a href="#" title="animalia">animalia</a></li>
  </ul>

  <div class="box">
    <div class="content">
      <ul>
        <li><h4>123,356</h4>occurrences</li>
        <li><h4>349</h4>species</li>
        <li class="last"><h4>23</h4>taxa</li>
      </ul>
      <a href="#" title="Download occurrences" class="candy_blue_button download"><span>Download occurrences</span></a>
    </div>
  </div>
</content>

<content tag="tabs">
  <div id="tabs">
    <ul>
      <li class="selected"><a href="<@s.url value='/dataset/${id}'/>"><span>Information</span></a></li>
      <!-- TODO: dynamically display occurrences entry only for occurrence datasets -->
      <li><a href="<@s.url value='/dataset/${id}/occurrence'/>"><span>Occurrences</span></a></li>
      <li><a href="<@s.url value='/dataset/${id}/activity'/>"><span>Activity <sup>(2)</sup></span></a></li>
      <li><a href="<@s.url value='/dataset/${id}/discussion'/>"><span>Discussion <sup>(5)</sup></span></a></li>
    </ul>
  </div>
</content>

<article>
  <header></header>
  <div class="content">

    <div class="header">
      <div class="left"><h2>Summary</h2></div>
    </div>

    <div class="left">
      <h3>Abstract</h3>

      <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu
        feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril
        delenit augue duis dolore te feugait nulla facilisi. Dolore eu feugiat nulla facilisis at vero eros et accumsan
        et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla
        facilisi.
      </p>

      <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu
        feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril
        delenit. </p>

      <h3>Purpose</h3>

      <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu
        feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril
        delenit augue duis dolore te feugait nulla facilisi.</p>

      <h3>Additional information</h3>

      <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu
        feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril
        delenit augue duis dolore te feugait nulla facilisi.</p>

      <h3>Temporal context</h3>

      <p>Jan 1st, 2001 → Jan 1st, 2009</p>

      <h3>Languages</h3>

      <p>English</p>

    </div>
    <div class="right">
      <div class="logo_holder">
        <img src="<@s.url value='/external/logos/logo1.jpg'/>"/>
      </div>

      <h3>Provided by</h3>

      <p><a href="<@s.url value='/member/123'/>" title="Botanic Garden and Botanical Museum Berlin-Dahlem">Botanic
        Garden and
        Botanical Museum Berlin-Dahlem</a></p>

      <h3>Hosted by</h3>

      <p><a href="<@s.url value='/member/123'/>" title="DanBIF Data Hosting Center">DanBIF Data Hosting Center</a></p>

      <h3>Endorsed by</h3>

      <p><a href="<@s.url value='/member/123'/>" title="GBIF Germany Participant Node">GBIF Germany Participant Node</a>
      </p>

      <h3>Alternative Identifiers</h3>

      <p>UC-10029192, REF-ejedei</p>

      <h3>External Links</h3>
      <ul>
        <li><a href="#" title="Original source">Original dataset source</a></li>
        <li><a href="#" title="Author's blog">Author's blog</a></li>
        <li><a href="#" title="Methodology">A discussion board over the methodology</a></li>
      </ul>
      <h3>Metadata</h3>
      <ul>
        <li class="download">EML file &nbsp;<a class="small download" href="#" title="EML file (english)">ENG</a> · <a
                class="small" href="#" title="EML file (spanish)">SPA</a> · <a class="small" href="#"
                                                                               title="EML file (german)">GER</a></li>
        <li class="download">ISO 1939 file &nbsp;<a class="small" href="#" title="ISO 1939 file (english)">ENG</a> · <a
                class="small" href="#" title="ISO 1939 file (spanish)">SPA</a></li>
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
      <div class="right"><h2>1,453 georeferenced occurrences</h2></div>
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


<article class="taxonomies">
  <header></header>
  <div class="content">
    <div class="header">
      <div class="left">
        <h2>Taxonomic distribution</h2>
        <ul>
          <li><a href="#" id="occurrences" class="sort">Showing occurrences<span class="more"></span></a></li>
          <li><a href="#" id="tax_sort_occurrences" class="sort">Sort occurrences<span class="more"></span></a></li>
        </ul>
      </div>
    </div>
    <div class="left">
      <div id="taxonomy">
        <div class="inner">
          <div class="sp">
            <ul>
              <li data="40"><span>Animalia</span> <a href="<@s.url value='/species/42'/>">see details</a>
                <ul>
                  <li data="10"><span>Acantocephala</span> <a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="90"><span>Annelida</span> <a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="180"><span>Arthropoda</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="40"><span>Brachipoda</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="40"><span>Cephalorhyncha</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="20"><span>Chaetognatha</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="50"><span>Chordata</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="10"><span>Cnidaria</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="60"><span>Ctenophora</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                </ul>
              </li>
              <li data="20"><span>Archaea</span><a href="<@s.url value='/species/42'/>">see details</a></li>
              <li data="10"><span>Bacteria</span><a href="<@s.url value='/species/42'/>">see details</a>
                <ul>
                  <li data="10"><span>Acidobacteria</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="90"><span>Actinobacteria</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="40"><span>Aquificae</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="40"><span>Bacteroidetes</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="10"><span>Acidobacteria</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="90"><span>Actinobacteria</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="40"><span>Aquificae</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="40"><span>Bacteroidetes</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="10"><span>Acidobacteria</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="90"><span>Actinobacteria</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="40"><span>Aquificae</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="40"><span>Bacteroidetes</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="10"><span>Acidobacteria</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="90"><span>Actinobacteria</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="40"><span>Aquificae</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="40"><span>Bacteroidetes</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="10"><span>Acidobacteria</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="90"><span>Actinobacteria</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="40"><span>Aquificae</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="40"><span>Bacteroidetes</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="10"><span>Acidobacteria</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="90"><span>Actinobacteria</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="40"><span>Aquificae</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="40"><span>Bacteroidetes</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="10"><span>Acidobacteria</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="90"><span>Actinobacteria</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="40"><span>Aquificae</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="40"><span>Bacteroidetes</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                </ul>
              </li>
              <li data="90"><span>Chromista</span><a href="<@s.url value='/species/42'/>">see details</a></li>
              <li data="30"><span>Fungi</span><a href="<@s.url value='/species/42'/>">see details</a></li>
              <li data="50"><span>Plantae</span><a href="<@s.url value='/species/42'/>">see details</a>
                <ul>
                  <li data="10"><span>Anthocerotophyta</span><a href="<@s.url value='/species/42'/>">see details</a>
                    <ul>
                      <li data="80"><span>Anthocerotopsida</span><a href="<@s.url value='/species/42'/>">see details</a>
                        <ul>
                          <li data="10"><span>Anthocerotales</span><a href="<@s.url value='/species/42'/>">see
                            details</a>
                            <ul>
                              <li data="10"><span>Anthocerotaceae</span><a href="<@s.url value='/species/42'/>">see
                                details</a>
                                <ul>
                                  <li data="10"><span>Anthoceros</span><a href="<@s.url value='/species/42'/>">see
                                    details</a>
                                  </li>
                                  <li data="90"><span>Phaeoceros</span><a href="<@s.url value='/species/42'/>">see
                                    details</a>
                                  </li>
                                </ul>
                              </li>
                            </ul>
                          </li>
                          <li data="20"><span>Codoniaceae</span><a href="<@s.url value='/species/42'/>">see details</a>
                          </li>
                          <li data="30"><span>Dendrocerotaceae</span><a href="<@s.url value='/species/42'/>">see
                            details</a></li>
                          <li data="60"><span>Notothyladaceae</span><a href="<@s.url value='/species/42'/>">see
                            details</a></li>
                        </ul>
                      </li>
                    </ul>
                  </li>
                  <li data="80"><span>Bacillariophyta</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="90"><span>Bryophyta</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="40"><span>Chlorophyta</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="20"><span>Cyanidiophyta</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="30"><span>Cycadophyta</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="80"><span>Bacillariophyta</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="90"><span>Bryophyta</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="40"><span>Chlorophyta</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="20"><span>Cyanidiophyta</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                  <li data="30"><span>Cycadophyta</span><a href="<@s.url value='/species/42'/>">see details</a></li>
                </ul>
              </li>
              <li data="100"><span>Protozoa</span><a href="<@s.url value='/species/42'/>">see details</a></li>
              <li data="60"><span>Viruses</span><a href="<@s.url value='/species/42'/>">see details</a></li>

              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="right">
      <h3>More occurrences species</h3>
      <ul>
        <li><a href="<@s.url value='/species/42'/>" title="Puma concolor">Puma concolor</a> <span class="number">2,002,372</span>
        </li>
        <li><a href="<@s.url value='/species/42'/>" title="Puma concolor">Puma concolor</a> <span
                class="number">9,123</span></li>
        <li><a href="<@s.url value='/species/42'/>" title="Puma concolor">Puma concolor</a> <span
                class="number">200</span></li>
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

      <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu
        feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril
        delenit. </p>

      <h3>Design description</h3>

      <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu
        feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril
        delenit augue duis dolore te feugait nulla facilisi. Dolore eu feugiat nulla facilisis at vero eros et accumsan
        et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla
        facilisi.</p>

      <h3>Funding</h3>

      <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu
        feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril
        delenit augue duis dolore te feugait nulla facilisi.</p>

      <h3>Team</h3>

      <ul class="team">
        <li>
          <h4>Paul J. Morris</h4>
          <h4 class="position">Resource Contact</h4>
          <a href="#" title="Paul J. Morris' email">mole@morris.net</a>
          1-215-299-1161
        </li>

        <li>
          <h4>Markus Doring</h4>
          <h4 class="position">Taxonomy</h4>
          <a href="#" title="Markus doring's email">mdoring@morris.net</a>
          1-215-299-1161
        </li>

        <li>
          <h4>Javier Álvarez</h4>
          <h4 class="position">Resource Contact</h4>
          <a href="#" title="Javier Álvarez email">javieralvarez@morris.net</a>
          <span class="phone">1-215-299-1161</span>
        </li>

      </ul>
    </div>

    <div class="right">
      <h3>ASSOCIATED PARTIES</h3>

      <ul class="team vertical">
        <li>
          <h4>David Remsen</h4>
          <h4 class="position">GBIF Secretariat</h4>

          Universitetsparken 15, Copenhagen, Ø, Denmark
          <a href="#" title="David Remsen' email">dremsen@gbif.org</a>
          004535321472
        </li>

        <li>
          <h4>Javier de la Torre</h4>
          <h4 class="position">GBIF Spain Node</h4>
          <a href="#" title="Javier de la Torre's email">jatorre@gbif.org</a>
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

      <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu
        feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril
        delenit augue duis dolore te feugait nulla facilisi. Dolore eu feugiat nulla facilisis at vero eros et accumsan
        et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla
        facilisi.</p>

      <h3>Sampling description</h3>

      <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu
        feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril
        delenit augue duis dolore te feugait nulla facilisi. Dolore eu feugiat nulla facilisis at vero eros et accumsan
        et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla
        facilisi.</p>

      <h3>Quality control</h3>

      <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu
        feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril
        delenit augue duis dolore te feugait nulla facilisi.</p>

    </div>

    <div class="right">
      <h3>Collection name</h3>

      <p>Ave specimens (AVES123)</p>

      <h3>Parent identifier</h3>

      <p>AVES</p>

      <h3>Preservation method</h3>

      <p>Glycerin</p>

      <h3>Curational units</h3>
      <ul>
        <li>100/500 Specimens</li>
        <li>1000 (+/- 100) jars</li>
        <li>100/500 Boxes</li>
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

      <p>This dataset is released under an Open Data licence, so it can be used to anyone who cites it. </p>

      <h3>How to cite it</h3>

      <p>Alaska Ocean Observing System, Arctic Ocean Diversity (accessed through GBIF data portal, <a href="#"
                                                                                                      title="Alaska Ocean Observing System, Arctic Ocean Diversity">http://data.gbif.org/datasets/resource/654</a>,
        2011-05-05)</p>
    </div>

  </div>
  <footer></footer>
</article>

</body>
</html>
