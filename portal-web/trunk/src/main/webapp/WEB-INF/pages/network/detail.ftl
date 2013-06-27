<#import "/WEB-INF/macros/common.ftl" as common>
<html>
<head>
  <title>Network detail</title>
</head>
<body class="species">

<#assign tab="info"/>
<#assign memberType="network"/>
<#assign memberTypeLabel="network"/>
<#include "/WEB-INF/pages/member/inc/infoband.ftl">

<@common.article id="information" title="Network Information">
    <div class="left">
      <#include "/WEB-INF/pages/member/inc/basics.ftl">
    </div>

    <div class="right">
      <#if member.logoURL?has_content>
        <div class="logo_holder">
          <img src="${member.logoURL}"/>
        </div>
      </#if>
    </div>
</@common.article>

</body>
</html>
