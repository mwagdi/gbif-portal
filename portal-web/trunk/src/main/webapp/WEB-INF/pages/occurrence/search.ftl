<#import "/WEB-INF/macros/pagination.ftl" as macro>
<html>
  <head>
    <title>Occurrence Search Results</title>

    <content tag="extra_scripts">    
<!--    <link rel="stylesheet" href="<@s.url value='/css/combobox.css?v=2'/>"/>    -->
    <script src='<@s.url value='/js/vendor/jquery.url.js'/>' type='text/javascript'></script>
    <script type="text/javascript" src="<@s.url value='/js/vendor/jquery-ui-1.8.17.min.js'/>"></script>
    <script type="text/javascript" src="<@s.url value='/js/terms_suggest.js'/>"></script>
    <script type="text/javascript" src="<@s.url value='/js/species_autocomplete.js'/>"></script>
    <script type="text/javascript" src="<@s.url value='/js/dataset_autocomplete.js'/>"></script>
    <script type="text/javascript" src="<@s.url value='/js/country_autocomplete.js'/>"></script>
    
    <!--Maps-->
    <link rel="stylesheet" href="<@s.url value='/js/vendor/leaflet/leaflet.css'/>" />
    <link rel="stylesheet" href="<@s.url value='/js/vendor/leaflet/draw/leaflet.draw.css'/>" />
    <!--[if lte IE 8]><link rel="stylesheet" href="<@s.url value='/js/vendor/leaflet/leaflet.ie.css'/>" /><![endif]-->
    <script type="text/javascript" src="<@s.url value='/js/vendor/leaflet/leaflet.js'/>"></script>
    <script type="text/javascript" src="<@s.url value='/js/vendor/leaflet/draw/leaflet.draw.js'/>"></script>
    <script type="text/javascript" src="<@s.url value='/js/occurrence_filters.js'/>"></script>
    <script>                 
      var filtersFromRequest = new Object();   
      var countryList = [<#list countries as country><#if country.official>{label:"${country.title}",iso2Lettercode:"${country.iso2LetterCode}"}<#if country_has_next>,</#if></#if></#list>];
      function addFilters(filtersFromRequest,filterKey,filterValue,filterLabel) {
        filtersFromRequest[filterKey].push({ label: filterLabel, value:filterValue, key: filterValue, paramName: filterKey, submitted: true });
      } 
      <#if filters.keySet().size() gt 0>                   
         <#list filters.keySet() as filterKey>
            filtersFromRequest['${filterKey}'] = new Array();
           <#list filters.get(filterKey) as filterValue>
             //the title is taken from the link that has the filterKey value as its data-filter attribute
             addFilters(filtersFromRequest,'${filterKey}','${filterValue}','${action.getFilterTitle(filterKey,filterValue)}');                        
           </#list>
         </#list>
      </#if>
     $(document).ready(function() {  
       var widgetManager = new OccurrenceWidgetManager("<@s.url value='/occurrence/search'/>?",filtersFromRequest,".dropdown-menu",true);      
      });
    </script>

    <style type="text/css">
        div.box div.content {
            height: 45px !important;
        }
    </style>

    </content>
  </head>
  <body class="search typesmap">

    <content tag="infoband">
        <h2>Search occurrences</h2>
        <#if action.showDownload()>
        <div class="box">
          <div class="content">
            <a href="<@s.url value='/occurrence/download'/>?${request.getQueryString()!}" class="candy_blue_button"><span>Download occurrences</span></a>
          </div>
        </div>
        </#if>
    </content>

    <article class="ocurrence_results">
    <header></header>

    <div class="content" id="content">
      <#assign showOccurrenceKey =  table.hasSummaryField('OCCURRENCE_KEY')>
      <#assign showCatalogNumber =  table.hasSummaryField('CATALOG_NUMBER')>
      <#assign showScientificName =  table.hasSummaryField('SCIENTIFIC_NAME')>
      <#assign showCollectionCode =  table.hasSummaryField('COLLECTION_CODE')>
      <#assign showCollectorName =  table.hasSummaryField('COLLECTOR_NAME')>
      <#assign showDataset =  table.hasSummaryField('DATASET')>      
      <#assign showLocation =  table.hasColumn('LOCATION')>
      <#assign showDate =  table.hasColumn('DATE')>
      <#assign showBasisOfRecord =  table.hasColumn('BASIS_OF_RECORD')>      
      <table class="results">
        <#if !action.hasErrors()>
        <tr class="header">

          <td class="summary" colspan="${table.summaryColspan}">
            <#if !action.nameUsagesSuggestions.hasSuggestions()><h2>${searchResponse.count} results</h2></#if>
          

          <div class="options">
            <ul>
              <li>
                <a href="#" class="configure" id="configure_link" data-toggle="dropdown"><i></i> Configure</a>
                <div class="dropdown-menu configure filters" id="configure_widget">
                <div class="tip"></div>
                  <h4>Columns</h4>
                  <ul id="occurrence_columns">
                    <li><input type="checkbox" name="columns" value="LOCATION" id="chk-LOCATION" <#if showLocation>checked</#if>/> <label for="chk-LOCATION">Location</label></li>
                    <li><input type="checkbox" name="columns" value="BASIS_OF_RECORD" id="chk-BASIS_OF_RECORD" <#if showBasisOfRecord>checked</#if>/> <label for="chk-BASIS_OF_RECORD">Basis of record</label></li>
                    <li><input type="checkbox" name="columns" value="DATE" id="chk-DATE" <#if showDate>checked</#if>/> <label for="chk-DATE">Date</label></li>
                    <li class="divider"><input type="checkbox" name="columns" value="SUMMARY" id="chk-SUMMARY" class="visibility:hidden;" checked/></li>
                  </ul>
                  <h4>Summary fields</h4>
                  <ul id="summary_fields">
                    <li><input type="checkbox" name="summary" value="OCCURRENCE_KEY" id="chk-OCCURRENCE_KEY" <#if showOccurrenceKey>checked</#if>/> <label for="chk-OCCURRENCE_KEY">Occurrence key</label></li>
                    <li><input type="checkbox" name="summary" value="CATALOG_NUMBER" id="chk-CATALOG_NUMBER" <#if showCatalogNumber>checked</#if>/> <label for="chk-CATALOG_NUMBER">Catalog number</label></li>
                    <li><input type="checkbox" name="summary" value="COLLECTION_CODE" id="chk-COLLECTION_CODE" <#if showCollectionCode>checked</#if>/> <label for="chk-COLLECTION_CODE">Collection code</label></li>
                    <li><input type="checkbox" name="summary" value="COLLECTOR_NAME" id="chk-COLLECTOR_NAME" <#if showCollectorName>checked</#if>/> <label for="chk-COLLECTOR_NAME">Collector name</label></li>
                    <li><input type="checkbox" name="summary" value="SCIENTIFIC_NAME" id="chk-SCIENTIFIC_NAME" <#if showScientificName>checked</#if>/> <label for="chk-SCIENTIFIC_NAME">Scientific name</label></li>
                    <li><input type="checkbox" name="summary" value="DATASET" id="chk-DATASET" <#if showDataset>checked</#if>/> <label for="chk-DATASET">Dataset</label></li>                                       
                  </ul>
                  <div style="width:100px;" class="buttonContainer"><a href="#" class="button" id="applyConfiguration" style="width:30px;margin:auto"><span>Apply</span></a><div>                  
                </div>
              </li>
              <li>
                <a href="#" class="filters" data-toggle="dropdown"><i></i> Add a filter</a>
  
                <div class="dropdown-menu filters">
                  <div class="tip"></div>
                  <ul>
                    <li><a tabindex="-1" href="#" data-placeholder="Type a scientific name..." data-filter="TAXON_KEY"  title="Scientific name" data-template-filter="template-add-filter" data-input-classes="value species_autosuggest" class="filter-control">Scientific name</a></li>
                    <li><a tabindex="-1" href="#" data-placeholder="Type a location..." data-filter="BOUNDING_BOX" title="Bounding Box" data-template-filter="map-template-filter" class="filter-control">Location</a></li>
                    <!--Next li is a place holder to map GEOREFERENCEDto the bounding box widget-->
                    <li style="display:none;"><a tabindex="-1" href="#" data-filter="GEOREFERENCED" title="Bounding Box" data-template-filter="map-template-filter" class="filter-control">Location</a></li>
                    <li><a tabindex="-1" href="#" data-placeholder="Select a country..." data-filter="COUNTRY" title="Country" data-template-filter="template-simple-filter" class="filter-control">Country</a></li>
                    <li><a tabindex="-1" href="#" data-placeholder="Type a collector name..." data-filter="COLLECTOR_NAME" title="Collector name" data-template-filter="template-add-filter" data-input-classes="value collector_name_autosuggest auto_add" class="filter-control">Collector</a></li>
                    <li><a tabindex="-1" href="#" data-placeholder="Type a name..." data-filter="BASIS_OF_RECORD" title="Basis Of Record" data-template-filter="template-basis-of-record-filter" class="filter-control">Basis of record</a></li>
                    <li><a tabindex="-1" href="#" data-placeholder="Type a dataset name..." data-filter="DATASET_KEY" title="Dataset" data-template-filter="template-add-filter" data-input-classes="value dataset_autosuggest auto_add" class="filter-control">Dataset</a></li>
                    <li><a tabindex="-1" href="#" data-placeholder="Type a dataset date..." data-filter="DATE" title="Collection date" data-template-filter="template-add-date-filter" class="filter-control">Collection date</a></li>
                    <li><a tabindex="-1" href="#" data-placeholder="Type a catalog number..." data-filter="CATALOG_NUMBER" title="Catalog number" data-template-filter="template-add-filter" data-input-classes="value catalog_number_autosuggest auto_add" class="filter-control">Catalog number</a></li>                  
                    <li class="divider"></li>
                    <li class="more"><a tabindex="-1" href="#">Need a different filter?</a></li>
                  </ul>
                  <input type="hidden" id="nubTaxonomyKey" value="${nubTaxonomyKey}"/>
                </div>
              </li>
          </ul>
        </div>
        </td>
      </tr>     
        <#if !action.nameUsagesSuggestions.hasSuggestions() && searchResponse.count gt 0>
        <tr class="results-header">
          <td></td>
          <#if showLocation>
          <td><h4>Location</h4></td>
          </#if>
          <#if showBasisOfRecord>
          <td><h4>Basis of record</h4></td>
          </#if>
          <#if showDate>
          <td><h4>Date</h4></td>
          </#if>
        </tr>
        <#list searchResponse.results as occ>
        <tr>
          <td>
            <div class="header"> 
              <#if showOccurrenceKey>
                <span class="code">${occ.key?c}</span>
              </#if> 
              <#if showCatalogNumber && occ.catalogNumber?has_content><#if showOccurrenceKey>· </#if><span class="catalog">Cat. ${occ.catalogNumber!}</span></#if>
              <#if showCollectorName && occ.collectorName?has_content>
                <div class="code">Collector: ${occ.collectorName}</div>
              </#if>
              <#if showCollectionCode && occ.collectionCode?has_content>
                <div class="code">Collection: ${occ.collectionCode}</div>
              </#if>
            </div>
            <#if showScientificName && occ.scientificName?has_content><a href="<@s.url value='/occurrence/${occ.key?c}'/>">${occ.scientificName}</a></#if>
            <#if showDataset && occ.datasetKey?has_content>
             <div class="footer">Published by ${action.getDatasetTitle(occ.datasetKey)!} </div>
            </#if>              
          </td>
          <#if showLocation>
          <td class="country"><#if occ.country?has_content><div class="country">${occ.country.title!}</div></#if>
            <div class="coordinates">
              <#if occ.latitude?has_content || occ.longitude?has_content>
                <#if occ.latitude?has_content>${occ.latitude!?string("0.00")}<#else>-</#if>/<#if occ.longitude?has_content>${occ.longitude!?string("0.00")}<#else>-</#if>
              <#else>
                N/A
              </#if>
            </div>
          </td>
          </#if>
          <#if showBasisOfRecord>
          <td class="kind">
          <#if occ.basisOfRecord?has_content || occ.longitude?has_content>
            ${action.getFilterTitle('basisOfRecord',occ.basisOfRecord)!}
          <#else>
           N/A
          </#if>
          </td>
          </#if>
          <#if showDate>
          <td class="date">
            <#if occ.occurrenceMonth?has_content || occ.occurrenceYear?has_content>
              <#if occ.occurrenceMonth?has_content>${occ.occurrenceMonth!?c}<#else>-</#if>     
              /    
              <#if occ.occurrenceYear?has_content>${occ.occurrenceYear!?c}<#else>-</#if>
            <#else>
              N/A
            </#if>
          </td>
          </#if>
        </tr>
        </#list>
        </#if>         
        <#else>   
        <tr class="header">
          <td class="filters">     
            <ul>
            <#list action.fieldErrors.keySet() as field>            
                  <li><h4>${field}</h4>
                  <#list action.fieldErrors.get(field) as error>            
                      <div class="filter filter-error">${error}</div>         
                  </#list>
                  </li>            
            </#list>
            </ul>   
          </td>
         </tr>              
        </#if>    
   </table>    
    <div class="footer">
      <#if !action.nameUsagesSuggestions.hasSuggestions()>
        <@macro.pagination page=searchResponse url=currentUrl/>
      </#if>
    </div>
  </div>
  <footer></footer>    
  </article>

<#if action.showDownload()>
  <article class="download_ocurrences">
  <header></header>
  <div class="content">
  
    <div class="header">
      <h2>Download ${searchResponse.count} occurrences for your search</h2>
      <span> Or refine it using the <a href="<@s.url value='/occurrence/download'/>?${request.getQueryString()!}">advanced search</a></span>
    </div>

    <div class="dropdown">
      <a href="#" class="title" title="Download description"><span>Download occurrences</span></a>
      <ul>
        <li><a href="#a"><span>Download occurrences</span></a></li>
        <li><a href="#a"><span>Download placemarks</span></a></li>
        <li class="last"><a href="#b"><span>Download metadata</span></a></li>
      </ul>
    </div>
  </div>
  <footer></footer>  
  </article>
 </#if>
  <#include "/WEB-INF/pages/occurrence/inc/filters.ftl">

  <!-- /Filter templates -->
  <div class="infowindow" id="waitDialog">
    <div class="light_box">
      <div class="content" >
        <h3>Processing request</h3>
        <p>Wait while your request is processed...
        <img src="<@s.url value='/img/ajax-loader.gif'/>" alt=""/>
      </div>
    </div>
  </div>
</body>
</html>
