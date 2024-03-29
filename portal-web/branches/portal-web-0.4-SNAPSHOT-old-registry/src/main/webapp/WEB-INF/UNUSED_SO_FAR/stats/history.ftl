<html>
<head>
  <title>Historical Activity - GBIF</title>
  <content tag="extra_scripts">
    <script type="text/javascript" charset="utf-8">
      $(function() {
        if ($("#map").length) {
          var latlng = new google.maps.LatLng(-34.397, 150.644);
          var myOptions = { zoom: 5, center: latlng, disableDefaultUI: true, mapTypeId: google.maps.MapTypeId.ROADMAP };
          var map = new google.maps.Map(document.getElementById("map"), myOptions);
        }

        $("#dataset-graph1").addGraph(generateRandomValues(50), {width:275, height:200});
        $("#dataset-graph2").addGraph(generateRandomValues(50), {width:275, height:200});
        $("#dataset-graph3").addGraph(generateRandomValues(50), {width:275, height:200});

        $("#pie1").bindPie(36.5, Math.floor(Math.random() * 100));
        $("#pie2").bindPie(36.5, Math.floor(Math.random() * 100));
        $("#pie3").bindPie(36.5, 100);

        $("#pie4").bindMultiPie(36.5, [12,50]);
        $("#pie5").bindMultiPie(36.5, [32,45,77]);
        $("#pie6").bindMultiPie(36.5, [12,18,45,62]);

        $("#pie4legend").addMultiLegend(3);
        $("#pie5legend").addMultiLegend(4);
        $("#pie6legend").addMultiLegend(5);

        $(".horizontal_graph").bindGreyBars(400);

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
    <li><a href="<@s.url value='/stats'/>"><span>Content</span></a></li>
    <li class='selected'><a href="<@s.url value='/stats/history'/>" title="History"><span>History </span></a></li>
    <li><a href="<@s.url value='/stats/activity'/>"><span>Activity</span></a></li>
  </ul>
</content>

<article>
  <header></header>
  <div class="content">
    <div class="header">
      <div class="left"><h2>GBIF Data Portal history</h2></div>
    </div>
    <div class="left">
      <h3>Evolution of data records</h3>

      <p>In July 2007, the current GBIF data portal (data.gbif.org) was launched, to replace the previous prototype
        version. At the same time, the reference system for counting the growth of data content shifted from previously
        giving the number of records served by data publishes to (from July 2007 onwards) the number of records indexed
        and available through the GBIF data portal: with growing data content, the first measure had become increasingly
        less indicative of records available through the data portal, mainly due to overlap (duplication) and technical
        availability issues.</p>

      <p>The visible drop in the number of data records around July/August 2007 reflects this change in the count basis
        as well as an indexing catch-up period from the prototype portal to the current data portal.</p>
    </div>
    <div class="right">
      <h3>More history stats</h3>
      <ul>
        <li><a href="#">Evolution of basis of records</a></li>
        <li><a href="#">Data quality change over time</a></li>
        <li><a href="#">History statistics</a></li>
      </ul>
    </div>
  </div>
  <footer></footer>
</article>

<article class="mono_line">
  <header></header>
  <div class="content">
    <div class="header">
      <div><h2>Indexed data evolution</h2></div>
    </div>
    <div class="minigraphs">
      <div id="dataset-graph1" class="minigraph">
        <h3>121,221,212<span>occurrences</span></h3>
        <a href="#" id="help2" class="help"><img src="<@s.url value='/img/icons/questionmark.png'/>"/></a>

        <div class="percentage down">21% last year</div>
        <div class="start">1998</div>
        <div class="end">2011</div>
        <div class="lt"></div>
        <div class="rt"></div>
      </div>
      <div id="dataset-graph2" class="minigraph">
        <h3>21,232<span>occurrences datasets</span></h3>
        <a href="#" id="help3" class="help"><img src="<@s.url value='/img/icons/questionmark.png'/>"/></a>

        <div class="percentage up">21% last year</div>
        <div class="start">1998</div>
        <div class="end">2011</div>
        <div class="lt"></div>
        <div class="rt"></div>
      </div>
      <div id="dataset-graph3" class="minigraph last">
        <h3>213<span>checklists</span></h3>
        <a href="#" id="help" class="help"><img src="<@s.url value='/img/icons/questionmark.png'/>"/></a>

        <div class="percentage down">21% last year</div>
        <div class="start">1998</div>
        <div class="end">2011</div>
        <div class="lt"></div>
        <div class="rt"></div>
      </div>
    </div>
  </div>
  <footer></footer>
</article>


<article class="mono_line">
  <header></header>
  <div class="content">
    <h2>Progress toward targets</h2>

    <ul class="pies">
      <li><h3>HEMISPHERIC BALANCE</h3>

        <p>Aim: to balance the data publication on northern and southern hemisphere.</p>

        <div id="pie1"></div>
      </li>
      <li><h3>HEMISPHERIC BALANCE</h3>

        <p>Aim: to balance the coverage in the different taxa.</p>

        <div id="pie2"></div>
      </li>
      <li class="last"><h3>HEMISPHERIC BALANCE</h3>

        <p>Aim: to balance the coverage in the different taxa.</p>

        <div id="pie3"></div>
      </li>
    </ul>

  </div>
  <footer></footer>
</article>

<article class="mono_line">
  <header></header>
  <div class="content">
    <h2>Pie samples 1</h2>
    <ul class="pies">
      <li><h3>SAMPLE PIE</h3>

        <p>Aim: to balance the data publication on northern and southern hemisphere.</p>

        <div id="pie4" class="multipie"></div>
        <div id="pie4legend" class="pieMultiLegend">
          <ul>
            <li><a href="">Value 1</a></li>
            <li><a href="">Value 2</a></li>
            <li><a href="">Value 3</a></li>
          </ul>
        </div>
      </li>
      <li><h3>SAMPLE PIE 2</h3>

        <p>Aim: to balance the coverage in the different taxa.</p>

        <div id="pie5" class="multipie"></div>
        <div id="pie5legend" class="pieMultiLegend">
          <ul>
            <li><a href="">Value 1</a></li>
            <li><a href="">Value 2</a></li>
            <li><a href="">Value 3</a></li>
            <li><a href="">Value 4</a></li>
          </ul>
        </div>
      </li>
      <li class="last"><h3>Sample pie 3</h3>

        <p>Aim: to balance the coverage in the different taxa.</p>

        <div id="pie6" class="multipie"></div>
        <div id="pie6legend" class="pieMultiLegend">
          <ul>
            <li><a href="">Value 1</a></li>
            <li><a href="">Value 2</a></li>
            <li><a href="">Value 3</a></li>
            <li><a href="">Value 4</a></li>
            <li><a href="">Value 5</a></li>
          </ul>
        </div>
      </li>
    </ul>
  </div>
  <footer></footer>
</article>

<article>
  <header></header>
  <div class="content">
    <h2>Horizontal bar sample</h2>

    <div class="left horizontal_graph">
      <ul class="no_bullets">
        <li><a href="">Aranae</a>

          <div class="grey_bar">100</div>
        </li>
        <li><a href="">Opiriones</a>

          <div class="grey_bar">63</div>
        </li>
        <li><a href="">Parasitiformes</a>

          <div class="grey_bar">19</div>
        </li>
        <li><a href="">Pseudoscornopida</a>

          <div class="grey_bar">15</div>
        </li>
        <li><a href="">Sarcoptiformes</a>

          <div class="grey_bar">9</div>
        </li>
        <li><a href="">Scorpiones</a>

          <div class="grey_bar">6</div>
        </li>
        <li><a href="">Trombidiformes</a>

          <div class="grey_bar">3</div>
        </li>
        <li><a href="">Pseudoscornopida</a>

          <div class="grey_bar">1</div>
        </li>
      </ul>
    </div>
    <div class="right">
      <h3>Additional content</h3>

      <p>Some explanatory or aditional content here.</p>
    </div>
  </div>
  <footer></footer>
</article>

</body>
</html>
