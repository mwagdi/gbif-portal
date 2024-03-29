<html>
<head>
  <title>Country detail - GBIF</title>
  <content tag="extra_scripts">
    <script type="text/javascript" src="<@s.url value='/js/vendor/OpenLayers.js'/>"></script>
    <script type="text/javascript" src="<@s.url value='/js/openlayers_addons.js'/>"></script>
    <script type="text/javascript" src="<@s.url value='/js/Infowindow.js'/>"></script>
    <script type="text/javascript" src="<@s.url value='/js/types_map.js'/>"></script>
    <script type="text/javascript" charset="utf-8">
      $(function() {
        $("#dataset-graph1").addGraph(generateRandomValues(50));
        $("#dataset-graph2").addGraph(generateRandomValues(50));
        $("#dataset-graph3").addGraph(generateRandomValues(50));
        $("#dataset-graph4").addGraph(generateRandomValues(50));
      });
    </script>
  </content>
</head>
<body class="species typesmap">

<content tag="infoband">
  <ul class="breadcrumb">
    <li class="last"><a href="#" title="Countries">Countries</a></li>
  </ul>

  <h1>Poland</h1>

  <h3>Occurrences data related to this country</h3>

  <div class="box">
    <div class="content">
      <ul>
        <li><h4>1,356</h4>ocurrences</li>
        <li><h4>349</h4>subspecies</li>
        <li class="last"><h4>726</h4>taxa</li>
      </ul>
      <a href="#" title="Download ocurrences" class="download candy_blue_button"><span>Download ocurrences</span></a>
    </div>
  </div>
</content>

<content tag="tabs">
  <ul>
    <li class="selected"><a href="#"><span>Information</span></a></li>
  </ul>
</content>

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


<article>
  <header></header>
  <div class="content">

    <div class="header">
      <div class="left"><h2>Indexed data</h2></div>
    </div>

    <div class="left">
      <div class="minigraphs">
        <div id="dataset-graph1" class="minigraph">
          <h3>45<span>Datasets</span></h3>

          <div class="percentage down">21% last year</div>
          <div class="start">1998</div>
          <div class="end">2011</div>
          <div class="lt"></div>
          <div class="rt"></div>
        </div>
        <div id="dataset-graph2" class="minigraph last">
          <h3>25<span>Checklists</span></h3>

          <div class="percentage up">21% last year</div>
          <div class="start">1998</div>
          <div class="end">2011</div>
          <div class="lt"></div>
          <div class="rt"></div>
        </div>
      </div>
      <div class="minigraphs last">
        <div id="dataset-graph3" class="minigraph">
          <h3>123,599<span>occurrences</span></h3>

          <div class="percentage down">21% last year</div>
          <div class="start">1998</div>
          <div class="end">2011</div>
          <div class="lt"></div>
          <div class="rt"></div>
        </div>
        <div id="dataset-graph4" class="minigraph last">
          <h3>30,123<span>species</span></h3>

          <div class="percentage up">21% last year</div>
          <div class="start">1998</div>
          <div class="end">2011</div>
          <div class="lt"></div>
          <div class="rt"></div>
        </div>
      </div>
    </div>

    <div class="right no_border">
      <div class="light_box data_repatriation">
        <span class="number">12%</span>

        <div class="percentage_bar_background">
          <div class="percentage_bar"></div>
        </div>
        <p>biodiversity data from Poland currently owned by Poland national institutions.</p>
      </div>
      <h3>Contributor participants</h3>
      <ul class="no_bottom">
        <li><a href="<@s.url value='/member/123'/>">GBIF Germany</a></li>
        <li><a href="<@s.url value='/member/123'/>">GBIF United States of America</a></li>
        <li class="more"><a href="<@s.url value='/members'/>">and 13 more</a></li>
      </ul>

      <h3>Data publishers</h3>
      <ul class="no_bottom">
        <li><a href="<@s.url value='/member/123'/>">Natural Museum of Berlin</a></li>
        <li><a href="<@s.url value='/member/123'/>">Museo Natural de Mexico</a></li>
        <li class="more"><a href="<@s.url value='/members'/>">and 7 more</a></li>
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
          <li><a href="#" id="ocurrences" class="sort">Showing ocurrences<span class="more"></span></a></li>
          <li><a href="#" id="tax_sort_ocurrences" class="sort">Sort alphabetically<span class="more"></span></a></li>
        </ul>
      </div>
    </div>
    <div class="left">
      <div id="taxonomy">
        <div class="inner">
          <div class="sp">
            <ul>
              <li data="40"><span>Animalia</span> <a href="<@s.url value='/species/24'/>">see details</a>
                <ul>
                  <li data="10"><span>Acantocephala</span> <a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="90"><span>Annelida</span> <a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="180"><span>Arthropoda</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="40"><span>Brachipoda</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="40"><span>Cephalorhyncha</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="20"><span>Chaetognatha</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="50"><span>Chordata</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="10"><span>Cnidaria</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="60"><span>Ctenophora</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                </ul>
              </li>
              <li data="20"><span>Archaea</span><a href="<@s.url value='/species/24'/>">see details</a></li>
              <li data="10"><span>Bacteria</span><a href="<@s.url value='/species/24'/>">see details</a>
                <ul>
                  <li data="10"><span>Acidobacteria</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="90"><span>Actinobacteria</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="40"><span>Aquificae</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="40"><span>Bacteroidetes</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="10"><span>Acidobacteria</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="90"><span>Actinobacteria</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="40"><span>Aquificae</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="40"><span>Bacteroidetes</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="10"><span>Acidobacteria</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="90"><span>Actinobacteria</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="40"><span>Aquificae</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="40"><span>Bacteroidetes</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="10"><span>Acidobacteria</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="90"><span>Actinobacteria</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="40"><span>Aquificae</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="40"><span>Bacteroidetes</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="10"><span>Acidobacteria</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="90"><span>Actinobacteria</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="40"><span>Aquificae</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="40"><span>Bacteroidetes</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="10"><span>Acidobacteria</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="90"><span>Actinobacteria</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="40"><span>Aquificae</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="40"><span>Bacteroidetes</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="10"><span>Acidobacteria</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="90"><span>Actinobacteria</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="40"><span>Aquificae</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="40"><span>Bacteroidetes</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                </ul>
              </li>
              <li data="90"><span>Chromista</span><a href="<@s.url value='/species/24'/>">see details</a></li>
              <li data="30"><span>Fungi</span><a href="<@s.url value='/species/24'/>">see details</a></li>
              <li data="50"><span>Plantae</span><a href="<@s.url value='/species/24'/>">see details</a>
                <ul>
                  <li data="10"><span>Anthocerotophyta</span><a href="<@s.url value='/species/24'/>">see details</a>
                    <ul>
                      <li data="80"><span>Anthocerotopsida</span><a href="<@s.url value='/species/24'/>">see details</a>
                        <ul>
                          <li data="10"><span>Anthocerotales</span><a href="<@s.url value='/species/24'/>">see
                            details</a>
                            <ul>
                              <li data="10"><span>Anthocerotaceae</span><a href="<@s.url value='/species/24'/>">see
                                details</a>
                                <ul>
                                  <li data="10"><span>Anthoceros</span><a href="<@s.url value='/species/24'/>">see
                                    details</a>
                                  </li>
                                  <li data="90"><span>Phaeoceros</span><a href="<@s.url value='/species/24'/>">see
                                    details</a>
                                  </li>
                                </ul>
                              </li>
                            </ul>
                          </li>
                          <li data="20"><span>Codoniaceae</span><a href="<@s.url value='/species/24'/>">see details</a>
                          </li>
                          <li data="30"><span>Dendrocerotaceae</span><a href="<@s.url value='/species/24'/>">see
                            details</a></li>
                          <li data="60"><span>Notothyladaceae</span><a href="<@s.url value='/species/24'/>">see
                            details</a></li>
                        </ul>
                      </li>
                    </ul>
                  </li>
                  <li data="80"><span>Bacillariophyta</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="90"><span>Bryophyta</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="40"><span>Chlorophyta</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="20"><span>Cyanidiophyta</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="30"><span>Cycadophyta</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="80"><span>Bacillariophyta</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="90"><span>Bryophyta</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="40"><span>Chlorophyta</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="20"><span>Cyanidiophyta</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                  <li data="30"><span>Cycadophyta</span><a href="<@s.url value='/species/24'/>">see details</a></li>
                </ul>
              </li>
              <li data="100"><span>Protozoa</span><a href="<@s.url value='/species/24'/>">see details</a></li>
              <li data="60"><span>Viruses</span><a href="<@s.url value='/species/24'/>">see details</a></li>

              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="right">
      <h3>More occurrences species</h3>
      <ul>
        <li><a href="<@s.url value='/species/24'/>" title="Puma Concolor">Puma Concolor</a> <span class="number">2,002,372</span>
        </li>
        <li><a href="<@s.url value='/species/24'/>" title="Puma Concolor">Puma Concolor</a> <span
                class="number">9,123</span></li>
        <li><a href="<@s.url value='/species/24'/>" title="Puma Concolor">Puma Concolor</a> <span
                class="number">200</span></li>
      </ul>
    </div>
  </div>
  <footer></footer>
</article>

</body>
</html>
