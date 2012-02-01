<#--
 THIS INCLUDE GENERATES THE INFOBAND AND TABS FOR A DATASET PAGE
 to select a tab to be highlighted please assign on of the following to the freemarker variable "tab":

 <#assign tab="info"/>
 <#assign tab="activity"/>
 <#assign tab="discussion"/>
-->
<content tag="infoband">
  <ul class="breadcrumb">
    <li class="last"><a href="<@s.url value='/dataset'/>" title="Datasets">Datasets</a></li>
  </ul>

  <h1>${dataset.title}</h1>

  <h3 class="separator">Published by <a href="<@s.url value='/member/${dataset.owningOrganizationKey!}'/>">${dataset.owningOrganization.title!"Unknown"}</a></h3>

<#if (dataset.tags?size>0) >
  <ul class="tags">
    <#list dataset.tags as tag>
      <#if tag.predicate?has_content && tag.value?has_content>
        <li><a href="#" title="${tag.predicate}">${tag.predicate}=${tag.value}</a></li>
      </#if>
    </#list>
  </ul>
</#if>

<#if dataset.type?has_content && dataset.type == "OCCURRENCE">
  <div class="box">
    <div class="content">
      <ul>
        <li><h4>1,356</h4>Occurrences</li>
        <li><h4>349</h4>Species</li>
        <li class="last"><h4>726</h4>Taxa</li>
      </ul>
      <a href="#" title="Download occurrences"
         class="download candy_blue_button"><span>Download occurrences</span></a>
    </div>
  </div>
</#if>
<#if dataset.type?has_content && dataset.type == "CHECKLIST">
  <div class="box">
    <div class="content">
      <ul>
        <li><h4>349</h4>Species</li>
        <li class="last"><h4>726</h4>Taxa</li>
      </ul>
      <a href="#" title="Download occurrences"
         class="download candy_blue_button"><span>Download checklist</span></a>
    </div>
  </div>
</#if>
<#if dataset.type?has_content && dataset.type == "METADATA">
  <div class="box">
    <div class="content">
      <ul>
        <li><h4>349</h4>Species</li>
      </ul>
      <a href="#" title="Download metadata"
         class="download candy_blue_button"><span>Download metadata</span></a>
    </div>
  </div>
</#if>

</content>


<content tag="tabs">
  <ul>
    <li<#if (tab!"")=="info"> class='selected highlighted'</#if>><a href="<@s.url value='/dataset/${id!}'/>"
                                                                    title="Information"><span>Information</span></a>
    </li>
    <#if dataset.type?has_content && dataset.type == "OCCURRENCE">
      <!-- TODO: dynamically display occurrences entry only for occurrence datasets -->
      <li<#if (tab!"")=="occurrences"> class='selected highlighted'</#if>><a
              href="<@s.url value='/dataset/${id!}/occurrences'/>" title="Occurrences"><span>Occurrences</span></a>
      </li>
    </#if>
    <li<#if (tab!"")=="activity"> class='selected highlighted'</#if>><a
            href="<@s.url value='/dataset/${id!}/activity'/>" title="Activity"><span>Activity <sup>(2)</sup></span></a>
    </li>
    <li<#if (tab!"")=="discussion"> class='selected highlighted'</#if>><a href="<@s.url value='/dataset/${id!}/discussion'/>"
                                                                     title="Discussion"><span>Discussion <sup>(5)</sup></span></a>
    </li>
  </ul>
</content>
