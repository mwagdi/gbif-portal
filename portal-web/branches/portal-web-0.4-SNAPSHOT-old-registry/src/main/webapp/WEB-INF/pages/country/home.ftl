<html>
<head>
  <title>Countries</title>
  <link rel="stylesheet" href="<@s.url value='/js/vendor/jvectormap/jquery-jvectormap-1.2.2.css'/>" type="text/css" media="screen"/>
  <script type="text/javascript" src="<@s.url value='/js/vendor/jvectormap/jquery-jvectormap-1.2.2.min.js'/>"></script>
  <script type="text/javascript" src="<@s.url value='/js/vendor/jvectormap/jquery-jvectormap-world-mill-en.js'/>"></script>
  <script type='text/javascript'>
      $(function() {
        // http://jvectormap.com/tutorials/getting-started/
        var nodes = {
          <#list nodes as n>
              "${n.getIso2LetterCode()}": 1<#if n_has_next>,</#if>
          </#list>
        };
        $('#map').vectorMap({
            map: 'world_mill_en',
            backgroundColor: "white",
            series: {
              regions: [{
                values: nodes,
                scale: ['#4B8A08'],
                min: '1',
                max: '1'
              }]
            },
            regionStyle: {
              initial: {
                fill: '#6EA038',
                "fill-opacity": 0.8,
                stroke: 'none',
                "stroke-width": 0,
                "stroke-opacity": 1
              },
              hover: {
                fill: '#E7C535'
              }
            },
            onRegionClick: function(e, code){
              window.location = cfg.baseUrl + "/country/" + code;
            }
        });
      });
  </script>
    <style type="text/css">
        #map {
            width: 640px;
            height: 400px;
            padding-left: 30px;
        }
    </style>
</head>

<body class="dataset">

  <article class="dataset">
    <header></header>
    <div class="content">
      <h1>Countries</h1>
      <p>
        <div id="map"></div>
      </p>
    </div>

    <footer></footer>
  </article>

</body>
</html>
