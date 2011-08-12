<html>
<head>
  <title>Dataset registration (2/3) - GBIF</title>
  <meta name="menu" content="datasets"/>
</head>
<body class="register">

  <article id="step-1" class="tunnel">
    <header></header>
    <div class="content">
      <ul class="breadcrumb">
        <li><h2>Share your data in GBIF</h2></li>
        <li class="active"><h2>Register your dataset</h2></li>
        <li class="last"><h2>Finish</h2></li>
      </ul>

      <p>Once you have the DRT installed we just need to ask you for two simple things:</p>

      <div class="important">
        <div class="top"></div>
        <div class="inner">
          <img src="<@s.url value='/img/icons/computer_plug.png'/>" class="icon"/>

          <form>

            <div class="field">
              <p>Provide us your dataset URL access point. <a href="#" title="Help" id="help" class="help"><img
                      src="<@s.url value='/img/icons/questionmark.png'/>"/></a></p>
              <input type="text" name="text"/>
              <button type="submit" class="button"><span>Connect</span></button>
            </div>

            <div class="field">
              <p>Data publisher name <a href="#" title="Help" id="help2" class="help"><img
                      src="<@s.url value='/img/icons/questionmark.png'/>"/></a></p>
          <span class="input_text">
            <input id="publisher_name" name="publisher_name" type="text"/>
          </span>
            </div>


            <div class="field">
              <p>GBIF endorsing node <a href="#" title="Help" id="help3" class="help"><img
                      src="<@s.url value='/img/icons/questionmark.png'/>"/></a></p>
              <select id="data_policy" class="data_policy" name="data-policy">
                <option value="">Select one of the list below...</option>
                <option value="policy-1">Data policy 1</option>
                <option value="policy-2">Data policy 2</option>
                <option value="policy-3">Data policy 3</option>
                <option value="policy-4">Data policy 4</option>
              </select>
            </div>
          </form>
        </div>
        <div class="bottom"></div>
      </div>

      <nav><a href="<@s.url value='/dataset/register-step-3'/>" title="Finish" class="candy_white_button next"><span>Finish</span></a>

        <p>Clicking on "Finish" you are accepting the GBIF Data Providers <a href="<@s.url value='/about/sharing'/>"
                                                                             title="Terms &amp; Conditions">Terms &amp;
          Conditions</a></p></nav>
    </div>
    <footer></footer>
  </article>

</body>
</html>
