<#import "/WEB-INF/macros/common.ftl" as common>
<#import "/WEB-INF/macros/occ_metrics.ftl" as metrics>
<html>
<head>
  <title>Data Published by ${country.title}</title>
  <link rel="stylesheet" href="<@s.url value='/css/bootstrap-tables.css'/>" type="text/css" media="all"/>
  <link rel="stylesheet" href="<@s.url value='/js/vendor/leaflet/leaflet.css'/>" />
  <!--[if lte IE 8]><link rel="stylesheet" href="<@s.url value='/js/vendor/leaflet/leaflet.ie.css'/>" /><![endif]-->
  <script type="text/javascript" src="<@s.url value='/js/vendor/leaflet/leaflet.js'/>"></script>
  <script type="text/javascript" src="<@s.url value='/js/map.js'/>"></script>
  <script type="text/javascript" src="<@s.url value='/js/occ_metrics.js'/>"></script>
  <script type="text/javascript">
      $(function() {
          $("#mapBy").densityMap("${isocode}", "PUBLISHING_COUNTRY");
      });
  </script>
</head>
<body>

<#assign tab="publishing"/>
<#include "/WEB-INF/pages/country/inc/infoband.ftl">


<#include "/WEB-INF/pages/country/inc/publishing_article.ftl">

<#include "/WEB-INF/pages/country/inc/latest_datasets_article.ftl">


<@common.article id="countries" title="Countries of origin">
  <div class="fullwidth">
    <#if countries?has_content>
      <p>
        ${country.title} hosts ${otherCountryRecords} records for ${otherCountries} other countries & territories.
        <br/>This accounts for ${otherCountryPercentage}% of the total data hosted by ${country.title}.
      </p>
      <ul>
      <#list countries as cw>
        <#if cw_index==6>
            <li class="more"><a href="<@s.url value='/country/${isocode}/publishing/countries'/>">${by.countries - 6} more</a></li>
            <#break />
        </#if>
          <li>
            <a title="${cw.obj.getTitle()}" href="<@s.url value='/country/${cw.obj.getIso2LetterCode()}'/>">${cw.obj.getTitle()}</a>
            <span class="note"> ${cw.count} occurrences<#if cw.geoCount gt 0>, ${100.0 * cw.geoCount / cw.count} % georeferenced</#if>.</span>
          </li>
      </#list>
      </ul>
    <#else>
      <p>None.</p>
    </#if>
  </div>
</@common.article>


<@common.article id="metrics" title="Data published by ${country.title}">
  <div class="fullwidth">
    <p>
      <@metrics.metricsTable baseAddress="hostCountry=${country}"/>
    </p>
    <p>
      <em>Note</em>: The numbers in brackets represent records that are georeferenced (i.e. with coordinates).
    </p>
  </div>
</@common.article>


<@common.article id="networks" title="International Networks">
  <div class="fullwidth placeholder_temp">
    <p>
      Institutions in ${country.title} participate in the following international networks.
    </p>
    <ul>
        <li>BCI</li>
        <li>OBIS</li>
        <li>eBird</li>
    </ul>
  </div>
</@common.article>

<@common.article id="hosting" title="Data hosting services" titleRight="Metadata catalogues">
  <div class="left">
      <ul class="placeholder_temp">
          <li>Via GBIF France IPT
              <ul>
                  <li>for GBIF Benin, 89,223 occurrences records in 8 resources.</li>
                  <li>for GBIF Togo, 7,623 occurrences records in 2 resources.</li>
                  <li>for GBIF Cameroon, 4,325 checklist records in 1 resources.</li>
              </ul>
          </li>
          <li>Use of data hosting service supplied by
              <ul>
                  <li>VertNet from GBIF US</li>
              </ul>
          </li>
      </ul>
  </div>

  <div class="right placeholder_temp">
      <h3>National metadata catalogues registered for ${country.title}</h3>
      <ul>
          <li>Staatsbibliothek XYZ</li>
      </ul>
  </div>
</@common.article>


</body>
</html>
