<#--
 THIS INCLUDE GENERATES THE INFOBAND AND TABS FOR A MEMBER PAGE
 to select a tab to be highlighted please assign on of the following to the freemarker variable "tab":

 <#assign tab="info"/>
 <#assign tab="activity"/>
 <#assign tab="datasets"/>
 <#assign tab="stats"/>
-->
<content tag="infoband">

  <h1 class="fullwidth">${common.limit(member.title, 70)}</h1>

  <#if type=='NODE'>
    <h3>
        <#--
        dont show a status for the GBIF Temp Node:
        http://dev.gbif.org/issues/browse/PF-966
        -->
      <#if member.key != '02c40d2a-1cba-4633-90b7-e36e5e97aba8'>
        <@s.text name="enum.nodestatus.${member.type}.${member.participationStatus}"/>
        <#if member.gbifRegion??> from <@s.text name="enum.region.${member.gbifRegion}"/></#if>
      </#if>
    </h3>
  <#else>
    <h3>
      <@s.text name="enum.membertype.${type}"/><#if member.homepage?has_content>.
        More info at: <a href="${member.homepage}" target="_blank" title="Homepage">${member.homepage}</a>
      </#if>
    </h3>
  </#if>

  <#if keywords?has_content>
    <ul class="tags">
      <#list keywords as k>
          <li>
              <a href="<#if type=='PUBLISHER'><@s.url value='/publisher/search?search=${k}'/><#else>#</#if>" title="${k}">${k}</a>
          </li>
      </#list>
    </ul>
  </#if>
</content>

<content tag="tabs">
  <#if tabhl!false>
    <#assign hl="highlighted" />
  </#if>
  <ul class="${hl!}">
    <li<#if (tab!"")=="info"> class='selected ${hl!}'</#if>>
      <a href="<@s.url value='/${type.name()?lower_case}/${id}'/>" title="Information"><span>Information</span></a>
    </li>
  </ul>
</content>
