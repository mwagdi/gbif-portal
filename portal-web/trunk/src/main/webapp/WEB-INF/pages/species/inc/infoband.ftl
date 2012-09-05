<#import "/WEB-INF/macros/common.ftl" as common>
<#--
 THIS INCLUDE GENERATES THE INFOBAND AND TABS FOR A SPECIES PAGE
 to select a tab to be highlighted please assign on of the following to the freemarker variable "tab":

 <#assign tab="info"/>
 <#assign tab="info-verbatim"/>
 <#assign tab="activity"/>
 <#assign tab="stats"/>
-->
<content tag="infoband">
  <h1>${common.limit(usage.scientificName, 36)}</h1>

  <h3>${(usage.rank!"Unranked")?capitalize}
    according to <a href="<@s.url value='/dataset/${usage.datasetKey}'/>">${(dataset.title)!"???"}</a>
  </h3>

  <h3>
  <#assign classification=usage.higherClassificationMap />
  <#list classification?keys as key>
    <a href="<@s.url value='/species/${key?c}'/>">${classification.get(key)}</a><#if key_has_next> &#x203A; </#if>
  </#list>
  </h3>

<#if usage.nub>
  <div class="box">
    <div class="content">
      <ul>
        <li><h4>${usage.numOccurrences}</h4>Occurrences</li>
        <#if usage.rank.isSpeciesOrBelow()>
          <li class="last"><h4>${usage.numDescendants}</h4>Infraspecies</li>
        <#else>
          <li class="last"><h4>${usage.numSpecies}</h4>Species</li>
        </#if>
      </ul>
      <a href="<@s.url value='/occurrence/search?nubKey=${usage.key?c}'/>" title="View Occurrences" class="download candy_blue_button"><span>View occurrences</span></a>
    </div>
  </div>
</#if>

</content>

<content tag="tabs">
  <#if !tab??><#assign tab="" /></#if>
  <#assign hl="" />
  <#if tab=="info-verbatim">
    <#assign hl="highlighted" />
  </#if>
  <ul class="${hl}">
    <li<#if tab=="info" || tab=="info-verbatim"> class='selected ${hl}'</#if>>
      <a href="<@s.url value='/species/${id?c}'/>" title="Information"><span>Information</span></a>
    </li>
    <li<#if tab=="activity"> class='selected ${hl}'</#if>>
      <a href="#" title="Activity"><span>Activity <sup>(2)</sup></span></a>
    </li>
    <li<#if tab=="stats"> class='selected ${hl}'</#if>>
      <a href="#" title="Stats"><span>Stats <sup>(2)</sup></span></a>
    </li>
  </ul>
</content>
