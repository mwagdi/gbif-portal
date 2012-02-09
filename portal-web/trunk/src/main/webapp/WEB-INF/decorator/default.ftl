<!doctype html>
<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
<!--[if lt IE 7 ]> <html class="no-js ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]>    <html class="no-js ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]>    <html class="no-js ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]>    <html class="ie9"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<!--
    __________  __________   ____        __           ____             __        __
   / ____/ __ )/  _/ ____/  / __ \____ _/ /_____ _   / __ \____  _____/ /_____ _/ /
  / / __/ __  |/ // /_     / / / / __ `/ __/ __ `/  / /_/ / __ \/ ___/ __/ __ `/ /
 / /_/ / /_/ // // __/    / /_/ / /_/ / /_/ /_/ /  / ____/ /_/ / /  / /_/ /_/ / /
 \____/_____/___/_/      /_____/\__,_/\__/\__,_/  /_/    \____/_/   \__/\__,_/_/
-->
<html class="no-js" lang="en"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <script type="text/javascript">
    <#-- dynamic js configuration, so we can use java configs in js -->
    var cfg = new Object();
    cfg.context="<@s.url value="/"/>";
    cfg.currentUrl="${currentUrl!}";
    cfg.baseUrl = "${baseUrl!}";
    cfg.wsClb="${cfg.wsClb!}";
    cfg.wsClbSearch="${cfg.wsClbSearch!}";
    cfg.wsClbSuggest="${cfg.wsClbSuggest!}";
    cfg.wsReg="${cfg.wsReg!}";
    cfg.wsRegSearch="${cfg.wsRegSearch!}";
    cfg.wsOcc="${cfg.wsOcc!}";
    cfg.wsOccSearch="${cfg.wsOccSearch!}";
  </script>
  <#-- Load bundle properties. The action class can filter out which properties
       to show according to their key's prefixes -->
  <#if resourceBundleProperties?has_content>
  <script id="resources" type="text/plain">
    <#list resourceBundleProperties?keys as property>
    ${property}=${resourceBundleProperties.get(property)}
    </#list>       
  </script>	  
  </#if>  
<#-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
Remove this if you use the .htaccess -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <title>${title}</title>
  <meta name="description" content="">
  <meta name="author" content="GBIF">

  <!-- Mobile viewport optimized: j.mp/bplateviewport -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Place favicon.ico & apple-touch-icon.png in the root of your domain and delete these references -->
  <link rel="shortcut icon" href="<@s.url value='/favicon.ico'/>">
  <link rel="apple-touch-icon" href="<@s.url value='/apple-touch-icon.png'/>">

  <!-- CSS: implied media="all" -->
  <link rel="stylesheet" href="<@s.url value='/css/style.css?v=2'/>"/>
  <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/themes/base/jquery-ui.css"
        type="text/css" media="all"/>
  <!-- Uncomment if you are specifically targeting less enabled mobile browsers
<link rel="stylesheet" media="handheld" href="css/handheld.css?v=2">  -->

  <script src="<@s.url value='/js/vendor/modernizr-1.7.min.js'/>"></script>

${head}

</head>
<body class="${page.properties["body.class"]!}">
  <header>


  <div id="templates">
    <#-- hidden html template for the javascript based login/reset popovers in widget.js -->
    <div id='template_login' class='infowindow'>
      <div class="lheader"></div>
      <span class='close'></span>
      <div class='content'>
        <h2>SIGN IN TO GBIF</h2>
        <p>You need to log in GBIF in order to download the data.</p>
        <form autocomplete='off' method='post' action='<@s.url value='/user/login'/>'>
          <div class='light_box'>
            <div class='field email'>
              <h3>Email</h3>
              <span class='input_text'>
                <input id='email' name='email' type='text'/>
                <span class='error' style='display:none'>Email not recognized</span>
              </span>
            </div>
            <div class='field password'>
              <h3>Password</h3>
              <span class='input_text'>
                <input id='password' name='password' type='password'/>
                <span class='error' style='display:none'>Wrong password</span>
              </span>
            </div>
            <div class='tl'></div>
            <div class='tr'></div>
            <div class='bl'></div>
            <div class='br'></div>
          </div>
          <a href='#' class='recover_password' title='Recover your password'>Forgot your password?</a>
          <button type='submit' class='candy_blue_button'><span>Login</span></button>
        </form>
        <div class='footer'>Do yo need to Sign up?
          <a href="<@s.url value='/user/register/step1'/>" title='<@s.text name="menu.register"/>'>Create your account</a>
        </div>
      </div>
      <div class="lfooter"></div>
    </div>

    <#-- hidden html template for the javascript based login/reset popovers in widget.js -->
    <div id='template_recover_password' class='infowindow'>
      <div class="lheader"></div>
      <span class='close'></span>
      <div class='content'>
        <h2>RECOVER YOUR PASSWORD</h2>
        <form autocomplete='off' method='post'>
          <div class='light_box'>
            <div class='field'>
              <h3>Your email</h3>
              <span class='input_text'><input id='email' name='email' type='text'/></span>
            </div>
            <div class='tl'></div>
            <div class='tr'></div>
            <div class='bl'></div>
            <div class='br'></div>
          </div>
          <a href='#' class='back_to_login' title='Back to the sign in form'>Back to the sign in form</a>
          <button type='submit' class='candy_blue_button'><span>Send email</span></button>
        </form>
        <div class='footer'>Do yo need to Sign up?
          <a href="<@s.url value='/user/register/step1'/>" title='<@s.text name="menu.register"/>'>Create your account</a>
        </div>
      </div>
      <div class="lfooter"></div>
    </div>
  </div>

    <!-- top -->
    <div id="top">
      <div class="content">
        <div class="account">
          <#if currentUser??>
            <a href="<@s.url value='/user/'/>" title='Account'>View your account</a>
            or
            <a href="<@s.url value='/user/logout'/>" title='<@s.text name="menu.logout"/>'><@s.text name="menu.logout"/></a>
          <#else>
            <a href="#" class="login" title='<@s.text name="menu.login"/>'><@s.text name="menu.login"/></a> or
            <a href="<@s.url value='/user/register/step1'/>" title='<@s.text name="menu.register"/>'><@s.text name="menu.register"/></a>
          </#if>
        </div>

        <div id="logo">
          <a href="<@s.url value='/'/>" class="logo"><img src="<@s.url value='/img/header/logo.png'/>"/></a>

          <h1><a href="<@s.url value='/'/>" title="DATA.GBIF.ORG">DATA.GBIF.ORG</a></h1>
          <span>Free and open access to biodiversity data</span>
        </div>

      <#assign menu=(page.properties["meta.menu"])!"home" />
      <#assign menuItems=["occurrence","dataset","species"] />
        <nav>
          <ul>
          <#list menuItems as m>
            <li<#if menu==m> class="selected"</#if>>
            <@s.text id="menuName" name="menu.${m}" />
                <@s.a value="/${m}" title="%{menuName}"><@s.text name="menu.${m}"/></@s.a></li>
          </#list>
            <li><a href="#" class="more" title="<@s.text name="menu.more"/>"><@s.text name="menu.more"/><span
                    class="more"></span></a>
            </li>
            <li class="search">
              <form href="<@s.url value='/dataset/search'/>" method="GET">
                <span class="input_text">
                  <input type="text" name="q"/>
                </span>
              </form>
            </li>
          </ul>
        </nav>
      </div>
    </div>
    <!-- /top -->

  <#if page.properties["page.infoband"]?has_content>
    <div id="infoband">
      <div class="content">
      ${page.properties["page.infoband"]}
      </div>
    </div>
  </#if>

  <#if page.properties["page.tabs"]?has_content>
    <div id="tabs">
      <div class="content">
      ${page.properties["page.tabs"]}
      </div>
    </div>
  </#if>

  </header>

  <div id="content">

  ${body}

  </div>

  <footer>
    <div class="content">
      <ul>
        <li><h3>EXPLORE THE DATA</h3></li>
        <li><a href="<@s.url value='/occurrence'/>"><@s.text name="menu.occurrence"/></a></li>
        <li><a href="<@s.url value='/dataset'/>"><@s.text name="menu.dataset"/></a></li>
        <li><a href="<@s.url value='/species'/>"><@s.text name="menu.species"/></a></li>
        <li><a href="<@s.url value='/country'/>"><@s.text name="menu.country"/></a></li>
        <li><a href="<@s.url value='/member'/>"><@s.text name="menu.member"/></a></li>
        <li><a href="<@s.url value='/theme'/>"><@s.text name="menu.theme"/></a></li>
      </ul>

      <ul>
        <li><h3>VIEW THE STATISTICS (not implemented)</h3></li>
        <li><a href="#">Global numbers</a></li>
        <li><a href="#">Taxonomic coverage</a></li>
        <li><a href="#">Providers</a></li>
        <li><a href="#">Countries</a></li>
      </ul>

      <ul>
        <li><h3>JOIN THE COMMUNITY</h3></li>
        <li><a href="<@s.url value='/user/register/step1'/>"><@s.text name="menu.register"/></a></li>
        <li><a href="<@s.url value='/dataset/register/step1'/>"><@s.text name="menu.share"/></a></li>
        <li><a href="<@s.url value='/terms'/>"><@s.text name="menu.terms"/></a></li>
        <li><a href="<@s.url value='/about'/>"><@s.text name="menu.about"/></a></li>
      </ul>

      <ul class="first">
      </ul>

      <ul class="first">
        <li class="no_title">
          <p id="blog1title"></a>
            <span id="blog1data" class="date"></span></p>
          <p id="blog1body"></p>
        </li>
      </ul>

      <ul>
        <li class="no_title">
          <p id="blog2title">
            <span id="blog2date" class="date"></span></p>
          <p id="blog2body"></p>
        </li>
      </ul>

      <ul>
        <li class="no_title">
          <p id="blog3title">
            <span id="blog3date" class="date"></span></p>
          <p id="blog3body"></p>
        </li>
      </ul>

    </div>
  </footer>

  <div class="copyright">
    <p>2011 &copy; GBIF. Data publishers retain all rights to data.</p>
  </div>

  <!-- JavaScript at the bottom for fast page loading -->
  <!-- scripts concatenated and minified via ant build script  -->
  <script type="text/javascript" src="<@s.url value='/js/vendor/jquery-1.7.1.min.js'/>"></script>
  <script type="text/javascript" src="<@s.url value='/js/vendor/jquery-ui-1.8.17.min.js'/>"></script>
  <script type="text/javascript" src="<@s.url value='/js/vendor/autocomplete.js'/>"></script>
  <script type="text/javascript" src="<@s.url value='/js/vendor/jquery.uniform.min.js'/>"></script>
  <script type="text/javascript" src="<@s.url value='/js/vendor/mousewheel.js'/>"></script>
  <script type="text/javascript" src="<@s.url value='/js/vendor/jscrollpane.min.js'/>"></script>
  <script type="text/javascript" src="<@s.url value='/js/vendor/jquery-scrollTo-1.4.2-min.js'/>"></script>
  <script type="text/javascript" src="<@s.url value='/js/vendor/underscore-min.js'/>"></script>
  <script type="text/javascript" src="<@s.url value='/js/helpers.js'/>"></script>
  <script type="text/javascript" src="<@s.url value='/js/widgets.js'/>"></script>
  <script type="text/javascript" src="<@s.url value='/js/graphs.js'/>"></script>
  <script type="text/javascript" src="<@s.url value='/js/rss.js'/>"></script>
  <script type="text/javascript" src="<@s.url value='/js/app.js'/>"></script>
  <script type="text/javascript" src="<@s.url value='/js/vendor/raphael-min.js'/>"></script>
  <script type="text/javascript" src="<@s.url value='/js/vendor/resourcebundle.js'/>"></script>
  <!-- end scripts-->

  <!--[if lt IE 7 ]>
  <script src="<@s.url value='/js/libs/dd_belatedpng.js'/>"></script>
  <script>DD_belatedPNG
          .fix("img, .png_bg"); // Fix any <img> or .png_bg bg-images. Also, please read goo.gl/mZiyb </script>
  <![endif]-->

  <!#-- keep this javascript here so we can use the s.url tag -->
  <script type="text/javascript">
    $(function() {
      $('nav ul li a.more').bindLinkPopover({
        links:{
          "<@s.text name="menu.country"/>":"<@s.url value='/country'/>",
          "<@s.text name="menu.member"/>":"<@s.url value='/member'/>",
          "<@s.text name="menu.theme"/>":"<@s.url value='/theme'/>",
          "<@s.text name="menu.stats"/>":"<@s.url value='/stats'/>",
      <#if admin>
        "<@s.text name="menu.admin"/>":"<@s.url value='/admin'/>",
      </#if>
          "<@s.text name="menu.about"/>":"<@s.url value='/about'/>"
        }
      });
    });
  </script>

<#if page.properties["page.extra_scripts"]?has_content>
${page.properties["page.extra_scripts"]}
</#if>

</body>
</html>
