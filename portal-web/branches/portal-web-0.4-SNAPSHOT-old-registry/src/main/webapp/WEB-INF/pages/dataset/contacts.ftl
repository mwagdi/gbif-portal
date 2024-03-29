<#import "/WEB-INF/macros/pagination.ftl" as paging>
<#import "/WEB-INF/macros/common.ftl" as common>
<html>
<head>
  <title>${dataset.title} - Contacts</title>
  <style type="text/css">
    #content div.contact {
      min-height: 125px;
    }
  </style>
</head>
<body class="species">

<#assign tab="info"/>
<#assign tabhl=true />
<#include "/WEB-INF/pages/dataset/inc/infoband.ftl">

  <div class="back">
    <div class="content">
      <a href="<@s.url value='/dataset/${id}'/>" title="Back to dataset overview">Back to dataset overview</a>
    </div>
  </div>

  <article class="results">
    <header></header>
    <div class="content">

      <div class="header">
        <div class="left">
          <h2>Contacts</h2>
        </div>
      </div>

      <div class="fullwidth">

        <h2>Primary Contacts</h2>
        <@common.contactList preferredContacts />

        <#if (dataset.project.contacts)?has_content>
          <h2>Project Personnel</h2>
          <@common.contactList dataset.project.contacts />
        </#if>

        <#if otherContacts?has_content >
          <h2>Associated Parties</h2>
          <@common.contactList otherContacts/>
        </#if>

      </div>

    </div>
    <footer></footer>
  </article>

</body>
</html>
