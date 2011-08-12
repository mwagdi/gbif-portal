<html>
<head>
  <title>Dataset Search Results - GBIF</title>
  <meta name="menu" content="dataset"/>
</head>
<body class="search">

  <content tag="infoband">
    <h2>Search datasets</h2>

    <form>
      <input type="text" name="q"/>
    </form>
  </content>

  <article class="results light_pane">
    <header></header>
    <div class="content">

      <div class="header">
        <div class="left">
          <h2>${datasets?size} results for "${q!}"</h2>
          <a href="#" class="sort" title="Sort by relevance">Sort by relevance <span class="more"></span></a>
        </div>
        <div class="right"><h3>Refine your search</h3></div>
      </div>


      <div class="left">

        <!-- full examples -->
        <div class="result">
          <h2><a href="<@s.url value='/dataset/42'/>" title="World Mangroves Fauna"><strong>MOCK OCCURRENCES: World
            Mangroves Fauna</strong></a>
          </h2>

          <p>An occurrences dataset published by <a href="<@s.url value='/member/123'/>">Academy of Natural Sciences</a>
            at 1978.
          </p>

          <div class="footer"><p>201.456 occurrences | covering Europe, Asia, Africa and Oceania</p></div>
        </div>

        <div class="result">
          <h2><a href="<@s.url value='/dataset/1'/>" title="Herpetology"><strong>MOCK CHECKLIST:
            Herpetology</strong></a></h2>

          <p>A checklist published by <a href="<@s.url value='/member/123'/>" title="Academy of Natural Sciences">Academy
            of
            Natural Sciences</a> at 1978.</p>

          <div class="footer"><p>201.456 name usages | covering Europe, Asia, Africa and Oceania</p></div>
        </div>

        <div class="result">
          <h2><a href="<@s.url value='/dataset/2'/>"
                 title="Absolute abundance of particles and planktic foraminifera in..".><strong>MOCK EXTERNAL DATASET:
            Absolute abundance of
            particles and planktic foraminifera in...</strong></a></h2>

          <p>An external dataset published by <a href="<@s.url value='/member/123'/>">Academy of Natural Sciences</a> at
            1978.
          </p>

          <div class="footer"><p>201.456 occurrences | covering Europe, Asia, Africa and Oceania</p></div>
        </div>

        <!-- dynamic -->
      <#--
      <#list datasets as d>
        <div class="result">
          <h2><a href="/dataset/${d.key!}" title="${d.name!"No Title"}"><strong>${d.name!"No Title"}</strong></a></h2>
          <p>A ??? dataset published by <a href="/members/${d.organisationKey!}">Organisation ${d.organisationKey!}</a></p>
          <div class="footer"><p>??? occurrences | covering ???</p></div>
        </div>
      </#list>
      -->

        <div class="footer">
          <a href="#" class="candy_white_button previous"><span>Previous page</span></a>
          <a href="#" class="candy_white_button next"><span>Next page</span></a>

          <div class="pagination">viewing page 2 of 31</div>
        </div>
      </div>


      <div class="right">

        <div class="refine">
          <h4>DATA PUBLISHER</h4>
          <a href="#">Any data provider</a>
        </div>

        <div class="refine">
          <h4>DATE OF PUBLICATION</h4>
          <a href="#">Any date</a>
        </div>

        <div class="refine">
          <h4>TAXA</h4>
          <a href="#" title="All species">All species <span class="more"></span></a>
        </div>

        <div class="refine">
          <h4>GEOSPATIAL COVERAGE</h4>
          <a href="#">All species</a>
        </div>

        <a href="#" title="Add another criteria" class="add_criteria">Add another criteria <span
                class="more"></span></a>
      </div>
    </div>
    <footer></footer>
  </article>

</body>
</html>
