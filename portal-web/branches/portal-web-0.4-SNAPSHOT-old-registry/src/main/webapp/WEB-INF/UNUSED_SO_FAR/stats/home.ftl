<html>
<head>
  <title>Statistics - GBIF</title>
  <meta name="gmap" content="true"/>
  <content tag="extra_scripts">
    <script type="text/javascript" charset="utf-8">
      $(function() {
        $("#dataset-graph1").addGraph(generateRandomValues(50), {height:200});
      });
    </script>
  </content>
</head>
<body class="species typesmap">

<content tag="infoband">
  <h1>GBIF Data Portal statistics</h1>

  <h3>Status in numbers</h3>
</content>

<content tag="tabs">
  <ul>
    <li class='selected'><a href="<@s.url value='/stats'/>"><span>Content</span></a></li>
    <li><a href="<@s.url value='/stats/history'/>" title="History"><span>History </span></a></li>
    <li><a href="<@s.url value='/stats/activity'/>"><span>Activity</span></a></li>
  </ul>
</content>

<article>
  <header></header>
  <div class="content">
    <div class="header">
      <div class="left"><h2>A statistical view of GBIF Data Portal</h2></div>
    </div>
    <div class="left">
      <h3>What data are available at the network, and what can we tell about them?</h3>

      <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet
        dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper
        suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p>

      <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu
        feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril
        delenit augue duis dolore te feugait nulla facilisi.</p>
    </div>
    <div class="right">
      <h3>More content stats</h3>
      <ul>
        <li><a href="#">Occurrences origin</a></li>
        <li><a href="#">Datasets vs. checklists</a></li>
        <li><a href="#">Participant nodes</a></li>
      </ul>
    </div>
  </div>
  <footer></footer>
</article>

<article class="indicators mono_line">
  <header></header>
  <div class="content">
    <div class="header">
      <h2>Main indicators</h2>
      <ul class="summary">

        <li>
          <div class="light_box">
            <h3>211,232,123</h3>
            occurrences
            <div class="tl"></div>
            <div class="tr"></div>
            <div class="bl"></div>
            <div class="br"></div>
          </div>
        </li>
        <li>
          <div class="light_box">
            <h3>22,354</h3>
            datasets
            <div class="tl"></div>
            <div class="tr"></div>
            <div class="bl"></div>
            <div class="br"></div>
          </div>
        </li>
        <li>
          <div class="light_box">
            <h3>21,282</h3>
            checklists
            <div class="tl"></div>
            <div class="tr"></div>
            <div class="bl"></div>
            <div class="br"></div>
          </div>
        </li>

        <li>
          <div class="light_box">
            <h3>2,123</h3>
            data publishers
            <div class="tl"></div>
            <div class="tr"></div>
            <div class="bl"></div>
            <div class="br"></div>
          </div>
        </li>

        <li class="last">
          <div class="light_box">
            <h3>48</h3>
            participants nodes
            <div class="tl"></div>
            <div class="tr"></div>
            <div class="bl"></div>
            <div class="br"></div>
          </div>
        </li>
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
              <li data="40"><span>Animalia</span> <a href="/species/detail.html">see details</a>
                <ul>
                  <li data="10"><span>Acantocephala</span> <a href="/species/detail.html">see details</a></li>
                  <li data="90"><span>Annelida</span> <a href="/species/detail.html">see details</a></li>
                  <li data="180"><span>Arthropoda</span><a href="/species/detail.html">see details</a></li>
                  <li data="40"><span>Brachipoda</span><a href="/species/detail.html">see details</a></li>
                  <li data="40"><span>Cephalorhyncha</span><a href="/species/detail.html">see details</a></li>
                  <li data="20"><span>Chaetognatha</span><a href="/species/detail.html">see details</a></li>
                  <li data="50"><span>Chordata</span><a href="/species/detail.html">see details</a></li>
                  <li data="10"><span>Cnidaria</span><a href="/species/detail.html">see details</a></li>
                  <li data="60"><span>Ctenophora</span><a href="/species/detail.html">see details</a></li>
                </ul>
              </li>
              <li data="20"><span>Archaea</span><a href="/species/detail.html">see details</a></li>
              <li data="10"><span>Bacteria</span><a href="/species/detail.html">see details</a>
                <ul>
                  <li data="10"><span>Acidobacteria</span><a href="/species/detail.html">see details</a></li>
                  <li data="90"><span>Actinobacteria</span><a href="/species/detail.html">see details</a></li>
                  <li data="40"><span>Aquificae</span><a href="/species/detail.html">see details</a></li>
                  <li data="40"><span>Bacteroidetes</span><a href="/species/detail.html">see details</a></li>
                  <li data="10"><span>Acidobacteria</span><a href="/species/detail.html">see details</a></li>
                  <li data="90"><span>Actinobacteria</span><a href="/species/detail.html">see details</a></li>
                  <li data="40"><span>Aquificae</span><a href="/species/detail.html">see details</a></li>
                  <li data="40"><span>Bacteroidetes</span><a href="/species/detail.html">see details</a></li>
                  <li data="10"><span>Acidobacteria</span><a href="/species/detail.html">see details</a></li>
                  <li data="90"><span>Actinobacteria</span><a href="/species/detail.html">see details</a></li>
                  <li data="40"><span>Aquificae</span><a href="/species/detail.html">see details</a></li>
                  <li data="40"><span>Bacteroidetes</span><a href="/species/detail.html">see details</a></li>
                  <li data="10"><span>Acidobacteria</span><a href="/species/detail.html">see details</a></li>
                  <li data="90"><span>Actinobacteria</span><a href="/species/detail.html">see details</a></li>
                  <li data="40"><span>Aquificae</span><a href="/species/detail.html">see details</a></li>
                  <li data="40"><span>Bacteroidetes</span><a href="/species/detail.html">see details</a></li>
                  <li data="10"><span>Acidobacteria</span><a href="/species/detail.html">see details</a></li>
                  <li data="90"><span>Actinobacteria</span><a href="/species/detail.html">see details</a></li>
                  <li data="40"><span>Aquificae</span><a href="/species/detail.html">see details</a></li>
                  <li data="40"><span>Bacteroidetes</span><a href="/species/detail.html">see details</a></li>
                  <li data="10"><span>Acidobacteria</span><a href="/species/detail.html">see details</a></li>
                  <li data="90"><span>Actinobacteria</span><a href="/species/detail.html">see details</a></li>
                  <li data="40"><span>Aquificae</span><a href="/species/detail.html">see details</a></li>
                  <li data="40"><span>Bacteroidetes</span><a href="/species/detail.html">see details</a></li>
                  <li data="10"><span>Acidobacteria</span><a href="/species/detail.html">see details</a></li>
                  <li data="90"><span>Actinobacteria</span><a href="/species/detail.html">see details</a></li>
                  <li data="40"><span>Aquificae</span><a href="/species/detail.html">see details</a></li>
                  <li data="40"><span>Bacteroidetes</span><a href="/species/detail.html">see details</a></li>
                </ul>
              </li>
              <li data="90"><span>Chromista</span><a href="/species/detail.html">see details</a></li>
              <li data="30"><span>Fungi</span><a href="/species/detail.html">see details</a></li>
              <li data="50"><span>Plantae</span><a href="/species/detail.html">see details</a>
                <ul>
                  <li data="10"><span>Anthocerotophyta</span><a href="/species/detail.html">see details</a>
                    <ul>
                      <li data="80"><span>Anthocerotopsida</span><a href="/species/detail.html">see details</a>
                        <ul>
                          <li data="10"><span>Anthocerotales</span><a href="/species/detail.html">see details</a>
                            <ul>
                              <li data="10"><span>Anthocerotaceae</span><a href="/species/detail.html">see details</a>
                                <ul>
                                  <li data="10"><span>Anthoceros</span><a href="/species/detail.html">see details</a>
                                  </li>
                                  <li data="90"><span>Phaeoceros</span><a href="/species/detail.html">see details</a>
                                  </li>
                                </ul>
                              </li>
                            </ul>
                          </li>
                          <li data="20"><span>Codoniaceae</span><a href="/species/detail.html">see details</a></li>
                          <li data="30"><span>Dendrocerotaceae</span><a href="/species/detail.html">see details</a></li>
                          <li data="60"><span>Notothyladaceae</span><a href="/species/detail.html">see details</a></li>
                        </ul>
                      </li>
                    </ul>
                  </li>
                  <li data="80"><span>Bacillariophyta</span><a href="/species/detail.html">see details</a></li>
                  <li data="90"><span>Bryophyta</span><a href="/species/detail.html">see details</a></li>
                  <li data="40"><span>Chlorophyta</span><a href="/species/detail.html">see details</a></li>
                  <li data="20"><span>Cyanidiophyta</span><a href="/species/detail.html">see details</a></li>
                  <li data="30"><span>Cycadophyta</span><a href="/species/detail.html">see details</a></li>
                  <li data="80"><span>Bacillariophyta</span><a href="/species/detail.html">see details</a></li>
                  <li data="90"><span>Bryophyta</span><a href="/species/detail.html">see details</a></li>
                  <li data="40"><span>Chlorophyta</span><a href="/species/detail.html">see details</a></li>
                  <li data="20"><span>Cyanidiophyta</span><a href="/species/detail.html">see details</a></li>
                  <li data="30"><span>Cycadophyta</span><a href="/species/detail.html">see details</a></li>
                </ul>
              </li>
              <li data="100"><span>Protozoa</span><a href="/species/detail.html">see details</a></li>
              <li data="60"><span>Viruses</span><a href="/species/detail.html">see details</a></li>

              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="right">
      <h3>Additional reports</h3>
      <ul>
        <li class="download"><a href="#">GBIF Data flora <abbr>(PDF)</abbr></a></li>
        <li class="download"><a href="#">Fungi at GBIF Data <abbr>(DOC)</abbr></a></li>
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
      <div class="right"><h2>223,272,453 georeferenced occurrences</h2></div>
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
      <div class="left"><h2>Temporal distribution</h2></div>
    </div>
    <div class="left">
      <div id="dataset-graph1" class="graph">
        <h3>211,232,354<span>occurrences</span></h3>

        <div class="start">1998</div>
        <div class="end">2011</div>
        <div class="lt"></div>
        <div class="rt"></div>
      </div>
    </div>
    <div class="right">
      <h3>First occurrence</h3>

      <p><a href="#">AFGS 212</a> (1921)</p>

      <h3>Last occurrence</h3>

      <p><a href="#">EUE 332</a> (2 days ago)</p>
    </div>
  </div>
  <footer></footer>
</article>


<article class="graph multigraph">
  <header></header>
  <div class="content">
    <div class="header">
      <div class="left short"><h2>Basis of record</h2></div>
      <div class="middle short"><h2>Geoprecission</h2></div>
    </div>
    <div class="left short">
      <div class="bargraph 19px">
        <div class="y_label">OCCURRENCES</div>
        <ul>
          <li>
            <a href="#">
              <div class="label">LABEL</div>
              <div class="value">100</div>
            </a>
          </li>
          <li>
            <a href="#">
              <div class="label">LABEL</div>
              <div class="value">35</div>
            </a>
          </li>
          <li>
            <a href="#">
              <div class="label">LABEL</div>
              <div class="value">87</div>
            </a>
          </li>
          <li>
            <a href="#">
              <div class="label">LABEL</div>
              <div class="value">67</div>
            </a>
          </li>
          <li><a href="#">
            <div class="label">LABEL</div>
            <div class="value">23</div>
          </a>
          </li>
          <li><a href="#">
            <div class="label">LABEL</div>
            <div class="value">12</div>
          </a>
          </li>
          <li><a href="#">
            <div class="label">LABEL</div>
            <div class="value">43</div>
          </a>
          </li>
          <li><a href="#">
            <div class="label">LABEL</div>
            <div class="value">62</div>
          </a>
          </li>
          <li><a href="#">
            <div class="label">LABEL</div>
            <div class="value">52</div>
          </a>
          </li>
          <li><a href="#">
            <div class="label">LABEL</div>
            <div class="value">87</div>
          </a>
          </li>
          <li><a href="#">
            <div class="label">LABEL</div>
            <div class="value">83</div>
          </a>
          </li>
          <li><a href="#">
            <div class="label">LABEL</div>
            <div class="value">92</div>
          </a>
          </li>
          <li><a href="#">
            <div class="label">LABEL</div>
            <div class="value">92</div>
          </a>
          </li>
        </ul>
        <div class="graph_axis">
          <div class="start">SPECIMEN</div>
          <div class="end">RECORD</div>
        </div>

      </div>

    </div>

    <div class="middle short">
      <div class="bargraph 19px">
        <div class="y_label">OCCURRENCES</div>

        <ul>
          <li>
            <a href="#">
              <div class="label">LABEL</div>
              <div class="value">100</div>
            </a>
          </li>
          <li>
            <a href="#">
              <div class="label">LABEL</div>
              <div class="value">35</div>
            </a>
          </li>
          <li>
            <a href="#">
              <div class="label">LABEL</div>
              <div class="value">87</div>
            </a>
          </li>
          <li>
            <a href="#">
              <div class="label">LABEL</div>
              <div class="value">67</div>
            </a>
          </li>
          <li><a href="#">
            <div class="label">LABEL</div>
            <div class="value">23</div>
          </a>
          </li>
          <li><a href="#">
            <div class="label">LABEL</div>
            <div class="value">12</div>
          </a>
          </li>
          <li><a href="#">
            <div class="label">LABEL</div>
            <div class="value">43</div>
          </a>
          </li>
          <li><a href="#">
            <div class="label">LABEL</div>
            <div class="value">62</div>
          </a>
          </li>
          <li><a href="#">
            <div class="label">LABEL</div>
            <div class="value">52</div>
          </a>
          </li>
          <li><a href="#">
            <div class="label">LABEL</div>
            <div class="value">87</div>
          </a>
          </li>
          <li><a href="#">
            <div class="label">LABEL</div>
            <div class="value">83</div>
          </a>
          </li>
          <li><a href="#">
            <div class="label">LABEL</div>
            <div class="value">92</div>
          </a>
          </li>
          <li><a href="#">
            <div class="label">LABEL</div>
            <div class="value">92</div>
          </a>
          </li>
        </ul>
        <div class="graph_axis">
          <div class="start">HIGHEST</div>
          <div class="end">LOWEST</div>
        </div>

      </div>
    </div>

    <div class="right">
      <h3>Other reports</h3>
      <ul>
        <li class="download"><a href="#">Report 1 <abbr>(PDF)</abbr></a>
        <li class="download"><a href="#">Report 2 <abbr>(XLS)</abbr></a>
      </ul>
    </div>


  </div>
  <footer></footer>
</article>

</body>
</html>
