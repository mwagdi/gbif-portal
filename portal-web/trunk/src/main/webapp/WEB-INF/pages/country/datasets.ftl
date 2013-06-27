<#import "/WEB-INF/macros/pagination.ftl" as paging>
<#import "/WEB-INF/macros/common.ftl" as common>
<html xmlns="http://www.w3.org/1999/html">
<head>
  <title>Datasets about ${country.title}</title>
</head>

<body>

<#assign tab="about"/>
<#assign tabhl=true />
<#include "/WEB-INF/pages/country/inc/infoband.ftl">

  <div class="back">
    <div class="content">
      <a href="<@s.url value='/country/${isocode}/about'/>" title="Back to summary about">Back to summary about ${country.title}</a>
    </div>
  </div>

  <article class="results">
    <header></header>
    <div class="content">

      <div class="header">
        <div class="left">
          <h2>${dsPage.count!0} occurrence datasets about ${country.title}</h2>
        </div>
      </div>

      <div class="fullwidth">

      <#list datasets as cw>
        <#assign ds=cw.obj />
        <div class="result">
          <h2><strong>
            <a title="${ds.title!}" href="<@s.url value='/dataset/${ds.key}'/>">${common.limit(ds.title!, 100)}</a>
            </strong>
          </h2>

          <div class="footer">
            <@s.text name="enum.datasettype.${ds.type!'UNKNOWN'}"/>
            with <a href="<@s.url value='/occurrence/search?country=${isocode}&datasetKey=${ds.key}'/>">${cw.count} records, ${cw.geoCount} georeferenced</a>
          </div>

        </div>
      </#list>

      <div class="footer">
        <@paging.pagination page=dsPage url=currentUrl/>
      </div>

      </div>

    </div>
    <footer></footer>
  </article>

</body>
</html>