<#import "/WEB-INF/macros/common.ftl" as common>
<html>
<head>
  <title>Occurrence Download - GBIF</title>

</head>
<body class="dataset">

<content tag="infoband">
    <h1>Occurrence Download</h1>
</content>

<@common.article id="started" title="Download Started">
    <div>
        <p>Your <a href="${cfg.wsOccDownload}${jobId}">download #${jobId}</a> is running</p>
        <p>A notification email with a link to download the results will be sent to the following addresses once ready:
          <ul>
            <#list emails as email>
              <li>${email}</li>
            </#list>
          </ul>
        </p>
        <p>During test phase you can also check our <a href="http://c1n1.gbif.org:11000/oozie/">oozie jobs directly</a></p>
    </div>
</@common.article>

</body>
</html>