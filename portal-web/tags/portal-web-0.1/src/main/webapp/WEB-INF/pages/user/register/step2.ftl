<html>
<head>
  <title>Register - GBIF</title>
</head>
<body class="dataset">

<article id="step-1" class="register">
<header></header>
<div class="content">

  <ul class="breadcrumb">
    <li><h2>Personal data</h2></li>
    <li class="active"><h2>Scientific profile</h2></li>
    <li class="last"><h2>Finish</h2></li>
  </ul>

  <p>Tell us something about your background, and the kind of work you do.</p>
  
  <form action="<@s.url value='/user/register/step3'/>" method="post" autocomplete="off">
    <div class="light_box">
      <div class="content">

        <div class="field">
          <h3>Organization</h3>
          <span class="input_text">
            <input id="organization" name="organization" type="text" />
          </span>
        </div>

        <div class="fields">
          <div class="field">
            <h3>Academic degree <span>Not mandatory</span></h3>
            <span class="input_text">
              <input id="academic_degree" name="academic_degree" type="text" placeholder="Bachelor, PhD..." />
            </span>
          </div>

          <div class="field last">
            <h3>Field of study <span>Not mandatory</span></h3>
            <span class="input_text">
              <input id="confirm_password" name="confirm_password" type="password" placeholder="Biology, botany, weather sciences..." />
            </span>
          </div>
        </div>

        <div class="field last">
          <h3>Intended data usage</h3>
            <textarea id="data_usage" name="data_usage" placeholder="Personal research, publication, data visualization..."></textarea>
        </div>

      </div>
      <div class="tl"></div> <div class="tr"></div> <div class="bl"></div> <div class="br"></div>
    </div>

    <button type="submit" class="candy_white_button next"><span>Finish</span></button>
  </form>
</div>
<footer></footer>
</article>

</body>
</html>
