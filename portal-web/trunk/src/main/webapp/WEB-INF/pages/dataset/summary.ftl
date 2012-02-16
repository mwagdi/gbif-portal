<#import "/WEB-INF/macros/common.ftl" as common>
<div class="header">
  <div class="left"><h2>Summary</h2></div>
</div>

<div class="left">
<#if dataset.description?has_content>
  <h3>Description</h3>

  <p>${dataset.description}</p>
</#if>
  <!-- purpose doesn't exist yet -->
<#if dataset.purpose?has_content>
  <h3>Purpose</h3>

  <p>${dataset.purpose}</p>
</#if>

  <!-- additionalInformation doesn't exist yet -->
<#if dataset.additionalInfo?has_content>
  <h3>Additional Information</h3>

  <p>${dataset.additionalInfo}</p>
</#if>

<#if dataset.temporalCoverages?has_content>
  <h3>Temporal coverages</h3>
  <#list dataset.temporalCoverages as cov>
    <#if cov.type?has_content && cov.type=="FORMATION_PERIOD">
      <h4>Formation period (verbatim)</h4>

      <p>${cov.period!""}</p>
    <#elseif cov.type?has_content && cov.type =="LIVING_TIME_PERIOD">
      <h4>Living time period (verbatim)</h4>

      <p>${cov.period!""}</p>
    <#elseif cov.date?has_content>
      <h4>Single date</h4>

      <p>${cov.date?date}</p>
    <#elseif cov.start?has_content && cov.start?has_content>
      <h4>Date range</h4>

      <p>${cov.start?date} - ${cov.end?date}</p>
    </#if>
  </#list>
</#if>

<#if dataset.metadataLanguage?has_content>
  <h3>Language of Metadata</h3>

  <#if dataset.metadataLanguage.interpreted?has_content>
    <p>${dataset.metadataLanguage.interpreted?string!}</p>
  <#else>
    <p class="verbatim_temp">${dataset.metadataLanguage.verbatim?string!}</p>
  </#if>


</#if>

<#if dataset.language?has_content>
  <h3>Language of Data</h3>

  <#if dataset.language.interpreted?has_content>
    <p>${dataset.language.interpreted?string!}</p>
  <#else>
    <p class="verbatim_temp">${dataset.language.verbatim?string!}</p>
  </#if>
</#if>

<#if (preferredContacts?size>0) >
  <h3>Primary Contacts</h3>
  <ul class="team">

    <#list preferredContacts as cnt>
        <li>
          <@common.contact con=cnt />
        </li>
      <#-- only show 3 primary contacts at max. If we have 3 (index=2) we know there are more to show
      <#if cnt_index==2>
        <p><a class="more_link, placeholder_temp" href="">see all</a></p>
        <#break />
      </#if>
      -->
    </#list>
  </ul>
</#if>

</div>