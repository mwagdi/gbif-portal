<#import "/WEB-INF/macros/common.ftl" as common>
<html>
<head>
  <title>GBIF Participation of ${country.title}</title>
</head>
<body>

<#assign tab="participation"/>
<#include "/WEB-INF/pages/country/inc/infoband.ftl">


<#assign showDescription=true/>
<#include "/WEB-INF/pages/country/inc/participation.ftl">

<#if node?? && node.contacts?has_content>
<@common.article id="contacts" title="Contacts">
    <div class="fullwidth">
      <#if node.contacts?has_content>
        <@common.contactList node.contacts />
      </#if>
    </div>
</@common.article>
</#if>

<#include "/WEB-INF/pages/country/inc/endorsing_article.ftl">

</body>
</html>
