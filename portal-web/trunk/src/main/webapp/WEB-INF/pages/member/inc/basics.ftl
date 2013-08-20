<#import "/WEB-INF/macros/common.ftl" as common>

<div class="left">
    <h3>Full Title</h3>
    <p>${member.title}</p>

  <#if member.description?has_content>
    <h3>Description</h3>
    <p>${member.description}</p>
  </#if>

  <#if member.metadataLanguage?has_content>
  <h3>Language of Metadata</h3>
  <p>${member.metadataLanguage}</p>
  </#if>

  <#if member.email?has_content>
  <h3>Email</h3>
  <p>${member.email}</p>
  </#if>

  <#if member.phone?has_content>
  <h3>Phone</h3>
  <p>${member.phone}</p>
  </#if>

  <#if (member.contacts?size>0) >
    <#-- <h3>Contacts</h3> -->
    <@common.contactList contacts=member.contacts/>
  </#if>
</div>

<div class="right">
  <#if member.logoUrl?has_content>
    <div class="logo_holder">
      <img src="<@s.url value='${member.logoUrl}'/>"/>
    </div>
  </#if>

  <h3>Address</h3>
  <@common.address address=member />

  <#if member.homepage?has_content>
    <h3>Website</h3>
    <#-- If the URL doesn't begin with a protocol like http, a link such as www.wii.gov.in will be interpreted as a relative path and resolve to http://uat.gbif.org/publisher/www.wii.gov.in -->
    <#-- Simple fix: append protocol to beginning of link -->
    <#if member.homepage?starts_with("http")>
        <p><a href="${member.homepage}">${member.homepage}</a></p>
    <#else>
        <p><a href="http://${member.homepage}">${member.homepage}</a></p>
    </#if>
  </#if>

  ${extraRight!}

</div>
