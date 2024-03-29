<!-- maximum function -->
<#function max x y>
    <#if (x<y)><#return y><#else><#return x></#if>
</#function>
<!-- minimum function -->
<#function min x y>
    <#if (x<y)><#return x><#else><#return y></#if>
</#function>
<#--
	Limits a string to a maximun length and adds an ellipsis if longer.
-->
<#function limit x max=100>
  <#assign x=(x!"")?trim/>
  <#if ((x)?length <= max)>
    <#return x>
    <#else>
      <#return x?substring(0, max)+"…" />
  </#if>
</#function>

<#-- 
  Truncates the string if too long and adds a more link
-->
<#macro limitWithLink text max link>
  <#assign text = text!""/>
  <#assign text = text?trim/>
  <#if (text?length <= max)>
    ${text}
    <#else>
    ${text?substring(0, max)}… <a class="more" href='${link}'>more</a>
  </#if>
</#macro>

<#macro usageSource component showChecklistSource=false showChecklistSourceOnly=false>
  <#if showChecklistSourceOnly>
    <#assign source=""/>
    <#else>
      <#assign source=(component.source!"")?trim/>
  </#if>
  <#if showChecklistSource>
    <#assign source><a href='<@s.url value='/species/${component.usageKey?c}'/>'>${(datasets.get(component.datasetKey).title)!"???"}</a><br/>${source}</#assign>
  </#if>
  <#if source?has_content || component.remarks?has_content>
  <a class="sourcePopup" data-message="${source!}" data-remarks="${component.remarks!}"></a>
  </#if>
</#macro>

<#macro usageSources components popoverTitle="Sources" showSource=true showChecklistSource=true>
  <#assign source>
    <#list components as comp>
      <p>
        <#if showSource>${comp.source!""}</#if>
        <#if showSource && showChecklistSource><br/></#if>
        <#if showChecklistSource><a href='<@s.url value='/species/${comp.usageKey?c}'/>'>${(datasets.get(comp.datasetKey).title)!"???"}</a></#if>
      </p><br/>
    </#list>
  </#assign>
  <a class="sourcePopup" title="${popoverTitle}" data-message="${source!}" data-remarks=""></a>
</#macro>

<#macro popup message remarks="" title="Source">
  <#if message?has_content>
  <a class="sourcePopup" title="${title}" data-message="${message}" data-remarks="${remarks!}"></a>
  </#if>
</#macro>

<#--
  a popup help along the lines of this:
  http://dev.gbif.org/issues/secure/attachment/11424/gbif_help_links.png 
-->
<#macro explanation message label remarks="" title="Help">
  <#if message?has_content>
    <a class="helpPopup" title="${title}" data-message="${message}" data-remarks="${remarks!}">${label}</a>
  </#if>
</#macro>

<#macro popover linkTitle popoverTitle>
  <a class="popover" title="${popoverTitle}" data-remarks="">${linkTitle}</a>
  <div class="message"><#nested></div>
</#macro>


<#-- Creates just an address block for a given WritableMember or Contact instance -->
<#macro address address>
<address>
 <!-- members use zip, but Contact postalCode -->
 <#assign props = ["${address.address!}", "${address.postalCode!}", "${address.zip!}", "${address.city!}", "${address.province!}", "${(address.country.title)!}" ]>
 <#list props as k>
   <#if k?has_content>
   ${k}<#if k_has_next>, </#if>
   </#if>
 </#list>

 <#if address.email?has_content>
   <a href="mailto:#" title="email">${address.email!}</a>
 </#if>
 <#if address.phone?has_content>
 ${address.phone!}
 </#if>
</address>
</#macro>


<#--
	Construct a Contact. Parameter is the actual contact object.
-->
<#macro contact con>
<div class="contact">
  <#if con.type?has_content>
   <div class="contactType">
    <#if con.type.interpreted?has_content>
      <@s.text name="enum.contacttype.${con.type.interpreted}"/>
    <#elseif con.type.verbatim?has_content>
      ${con.type.verbatim?string!}
    </#if>
   </div>
  </#if>
   <div class="contactName">
    ${con.firstName!} ${con.lastName!}
   </div>
  <#if con.position?has_content || con.organizationName?has_content>
   <div>
    ${con.position!}
    <#if con.position?has_content && con.organizationName?has_content> at </#if>
    ${con.organizationName!}
   </div>
  </#if>
  <@address address=con />
</div>
</#macro>

<#-- Creates a 2 column list of contacts-->
<#macro contactList contacts>
<div class="col">
  <#list contacts as c>
    <#if c_index%2==0>
      <@contact con=c />
    </#if>
  </#list>
</div>
<div class="col">
  <#list contacts as c>
    <#if c_index%2==1>
      <@contact con=c />
    </#if>
  </#list>
</div>
</#macro>

<#--
	Construct a Endpoint. Parameter is the actual endpoint object.
-->
<#macro endpoint ep>
<p>
  <b><h4>${ep.type}</h4></b>
  <#if ep.url?has_content>
  ${ep.url!}
  </#if>
</p>
</#macro>

<#--
	Construct a Identifier. Parameter is the actual identifier object.
-->
<#macro identifier i>
<p>
  <b><h4>${i.type}</h4></b>
  <#if i.identifier?has_content>
  ${i.identifier!}
  </#if>
</p>
</#macro>

<#macro citation c>
  ${c.text!}
  <#if c.identifier?has_content>
    <#if c.text?has_content>,</#if> <a href="${c.identifier}">${c.identifier}</a>
  </#if>
</#macro>

<#macro enumParagraph enum>
  <#if enum.interpreted?has_content>
  <p>${enum.interpreted?string}</p>
    <#else>
    <p class="verbatim_temp">${enum.verbatim?string!}</p>
  </#if>
</#macro>

<#macro article id="" title="" titleRight="" class="">
<article<#if id?has_content> id="${id}"</#if> class="${class!}">
  <header></header>
  <#if id?has_content>
    <a name="${id}"></a>
  </#if>
  <div class="content">
    <div class="header">
      <#if title?has_content>
        <div class="left">
          <h2>${title}</h2>
        </div>
      </#if>
      <#if titleRight?has_content>
        <div class="right">
          <h2>${titleRight}</h2>
        </div>
      </#if>
    </div>
    <#nested>
  </div>
  <footer></footer>
</article>
</#macro>

<#macro notice title>
<article class="notice">
  <header></header>
  <div class="content">
    <h3>${title!}</h3>
    <#nested>
    <img id="notice_icon" src="<@s.url value='/img/icons/notice_icon.png'/>" alt=""/>
  </div>
  <footer></footer>
</article>
</#macro>

<#macro cityAndCountry member>
${member.city!}<#if member.city?has_content && member.country?has_content>, </#if>${member.country!}
</#macro>
