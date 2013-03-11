<?php // fetch some page variables
	global $user;
	global $base_url ;
	global $base_path ;
	$dataportal_base_url = theme_get_setting( 'vizz2_dataportal_base_url','vizz2' ) ;
?>
<header>

  <!-- top -->
  <div id="top">
    <div class="content">
      <div class="account">
		<?php if (!$logged_in) { ?>
        <a href="<?php print $base_url?>/user/login" title='Login'>Login</a> or
        <a href="<?php print $base_url;?>/user/register" title='Create a new account'>Create a new account</a>
		<?php } else { ?>
			<?php if ($user->uid) { ?>
			<a href="<?php print $base_url;?>/user/<?php print ($user->uid) ?>/edit">Hello <?php print ( $user->name);?></a>
			<a href="<?php print $base_url;?>/user/logout">&nbsp;&nbsp;&nbsp;&nbsp;Logout</a>
			<?php } ?>
		<?php } ?>

      </div>

      
    <div id="logo">
      <a href="/portal/" class="logo"></a>
    </div>

    <div class="info">
      <h1>Global Biodiversity Information Facility</h1>
      <h2>Free and open access to biodiversity data</h2>

      <ul class="counters">
        <li><strong id="numOcc">377,177,914</strong> Occurrences</li>
        <li><strong id="numSpecies">1,022,246</strong> Species</li>
        <li><strong>10,028</strong> Datasets</li>
        <li><strong>419</strong> Data publishers</li>
      </ul>
    </div>
  

      <nav>
      <ul>
        <li>
        <a href="#" title="Data">Data</a>

        <div class="data">
          <a href="#"></a>
          <ul>
            <li><a href="/portal/occurrence">Occurrences</a></li>
            <li><a href="/portal/dataset">Datasets</a></li>
            <li><a href="/species">Species</a></li>
            <li class="divider"></li>
            <li><a class="placeholder_temp" href="#">Themes</a></li>
            <li><a class="placeholder_temp" href="#">Statistics</a></li>
            <li><a class="placeholder_temp" href="#">GBIF Data usage</a></li>
            <li class="divider"></li>
            <li><a class="placeholder_temp" href="#">Publish your data</a></li>
            <li><a class="placeholder_temp" href="#">Publishing workflow</a></li>
          </ul>
        </div>

        </li>

        <li>
        <a class="placeholder_temp" href="#" title="Community">Community</a>

        <div class="community">
          <a href="#"></a>
          <ul>
            <li><a class="placeholder_temp" href="#">Regions</a></li>
            <li><a class="placeholder_temp" href="#">Countries</a></li>
            <li><a class="placeholder_temp" href="#">Participant organizations</a></li>
            <li><a class="placeholder_temp" href="#">Data publishers</a></li>
            <li class="divider"></li>
            <li><a class="placeholder_temp" href="#">Capacity bulding</a></li>
            <li><a class="placeholder_temp" href="#">Training</a></li>
            <li><a class="placeholder_temp" href="#">BIF building</a></li>
            <li><a class="placeholder_temp" href="#">Whitepages</a></li>
          </ul>
        </div>

        </li>

        <li>
        <a href="#" title="About GBIF">About GBIF</a>

        <div class="about">
          <a href="#"></a>
          <ul>
            <li><a href="http://staging.gbif.org/drupal/newsroom/summary">News</a></li>
            <li class="divider"></li>
            <li><a class="placeholder_temp" href="#">Key partners</a></li>
            <li><a class="placeholder_temp" href="#">Mission</a></li>
            <li><a class="placeholder_temp" href="#">Governance details</a></li>
            <li><a class="placeholder_temp" href="#">Work programs</a></li>
            <li><a class="placeholder_temp" href="#">Key facts</a></li>
            <li class="divider"></li>
            <li><a href="/developer">Developer API</a></li>
          </ul>
        </div>

        </li>

        <li class="search">
        <form href="#" method="GET">
          <span class="input_text">
              <!-- Global search disabled until implemented later. See issue: http://dev.gbif.org/issues/browse/POR-387 -->
            <input type="text" name="q" disabled="true"/>
          </span>
        </form>
        </li>
      </ul>
      </nav>
    </div>
  </div>
  <!-- /top -->




  </header>


  <div id="content">

    <div class="container">

    <article class="search">

    <header>
    </header>

    <div class="content">

      <ul>
        <li>
        <h3>Enables biodiversity data sharing and re-use</h3>
        <ul>
          <li><a href="#">Why publish your data?</a></li>
          <li><a href="#">How to publish your data</a></li>
          <li><a href="#">Data from citizen scientists</a></li>
        </ul>
        </li>

        <li>
        <h3>Supports biodiversity research</h3>
        <ul>
          <li><a href="#">Why publish your data?</a></li>
          <li><a href="#">How to publish your data</a></li>
          <li><a href="#">Data from citizen scientists</a></li>
        </ul>
        </li>

        <li>
        <h3>Collaborates as a global community</h3>
        <ul>
          <li><a href="#">Why publish your data?</a></li>
          <li><a href="#">How to publish your data</a></li>
          <li><a href="#">Data from citizen scientists</a></li>
        </ul>
        </li>

      </ul>
    </div>
    <div class="footer">

      <form>
        <span class="input_text">
          <input type="text" name="q" placeholder="Search GBIF for species, datasets or countries" class="focus">
        </span>
        <button class="search_button"><span>Search</span></button>
      </form>

    </div>
    <footer></footer>
    </article>

    <article class="latest-news">

    <header></header>

    <div class="content">

      <div class="header">
        <div class="left">
          <h1>Latest GBIF news</h1>
        </div>
        <div class="right">
          Go to <a href="<?php print $base_url?>/newsroom/summary">GBIF Newsroom</a>
        </div>
      </div>
      
<?php  
	$results = array() ;
	$view = views_get_view_result('featurednewsarticles');
	foreach ($view as $key => $vnode) {
		$nid = $vnode->nid  ;
		$anode = node_load( $nid ) ;
		$results[$key] = $anode ;
	}
?>
      <div class="featured">
        <h3>Featured story</h3>
		<a class="title" href="<?php print $base_url.'/page/'.($results[0]->nid) ?>"><?php print ($results[0]->title)?></a>
		<?php print( render( field_view_field('node', $results[0], 'field_featured', array('settings' => array('image_style' => 'featured'))) ) ); ?>
		<p><?php print ( $results[0]->body['und'][0]['summary'] ) ; ?></p>
        <a href="<?php print $base_url.'/page/'.($results[0]->nid) ?>">Read more</a>
      </div>

      <div class="latest">
        <h3>Latest news</h3>

<?php  
	$results = array() ;
	$view = views_get_view_result('newsarticles');

	foreach ($view as $key => $vnode) {
		$nid = $vnode->nid  ;
		$anode = node_load( $nid ) ;
		$results[$key] = $anode ;
	}
?>
			<ul>
		<?php for ( $td = 0 ; $td < 4 ; $td++ ) : ?>
			<li>
			<div class="date"><?php { print( format_date($results[$td]->created, 'custom', 'F jS, Y')) ; } ?></div>
			<a href="<?php print $base_url.'/page/'.$results[$td]->nid ?>" class="title"><?php print $results[$td]->title ?></a>
			</li>
		<?php endfor ?>        
			</ul>

        <a href="<?php print $base_url?>/newsroom/news" class="read-more">More</a>
      </div>

      <div class="upcoming">
        <h3>Upcoming events</h3>

        <ul>

          <li>
          <div class="calendar">
            <div class="month">Sep</div>
            <strong>19</strong>
          </div>
          <div class="location">Lillehammer, Norway</div> 
          <a href="#">GBIF Science Symposium 2012</a>
          </li>

          <li>
          <div class="calendar">
            <div class="month">Sep</div>
            <strong>19</strong>
          </div>
          <div class="location">Lillehammer, Norway</div> 
          <a href="#">GBIF Science Symposium 2012</a>
          </li>

          <li>
          <div class="calendar">
            <div class="month">Sep</div>
            <strong>19</strong>
          </div>
          <div class="location">Lillehammer, Norway</div> 
          <a href="#">GBIF Science Symposium 2012</a>
          </li>

          <li>
          <div class="calendar">
            <div class="month">Sep</div>
            <strong>19</strong>
          </div>
          <div class="location">Lillehammer, Norway</div> 
          <a href="#">GBIF Science Symposium 2012</a>
          </li>

        </ul>

        <a href="#" class="read-more">More</a>

      </div>


    </div>
    <footer></footer>
    </article>



    <article class="featured">
    <header></header>
    <div class="content">
      <div class="header">
        <div class="left">
          <h1>Featured GBIF data use</h1>
        </div>
        <div class="right">
          See all <a href="<?php print $base_url?>/newsroom/uses">GBIF data use stories</a>
        </div>
      </div>
      <div class="inner">
        <ul>
<?php
$results = array() ;
$view = views_get_view_result('usesofdatafeaturedarticles');
foreach ($view as $key => $vnode) {
	$nid = $vnode->nid  ;
	$anode = node_load( $nid ) ;
	$results[$key] = $anode ;
} 
?>
	<?php for ( $td = 0 ; $td < 3 ; $td++ ) : ?>
		<li class="<?php  if ( (($td + 1) % 3 ) == 0 ) echo 'last' ; ?>">
			<a href="<?php print $base_url.'/page/'.($results[$td]->nid) ?>">
			<?php print( render( field_view_field('node', $results[$td], 'field_featured', array('settings' => array('image_style' => 'featured'))) ) ); ?>
			</a>
			<a class="title" href="<?php print $base_url.'/page/'.($results[$td]->nid) ?>"><?php print( smart_trim( $results[$td]->title, 50))?></a>
			<p><?php print ( $results[$td]->body['und'][0]['summary'] ) ; ?></p>
		</li>
	<?php endfor ?>
      </ul>
    </div>
  </div>

  <div class="footer">
    <a href="#">Birds</a> &middot;
    <a href="#">Butterflies</a> &middot;
    <a href="#">Lizards</a> &middot;
    <a href="#">Reptiles</a> &middot;
    <a href="#">Fishes</a> &middot;
    <a href="#">Mammals</a> &middot;
    <a href="#">Insects</a>
  </div>

  <footer></footer>
  </article>


  <article class="next_news">
  <header></header>
  <div class="content">
    <h3>Contribute to gbif</h3>
    <a href=""><h1>Learn how to publish your organization data in GBIF</h1></a>
  </div>
  <footer></footer>
  </article>
</div>



  </div>

  <footer>
  <div class="inner">
    <ul>
      <li><h3>EXPLORE THE DATA</h3></li>
      <li><a href="#">Occurrences</a></li>
      <li><a href="#">Datasets</a></li>
      <li><a href="#">Species</a></li>
      <li><a href="#">Countries</a></li>
      <li><a href="#">GBIF Network</a></li>
      <li><a href="#">Themes</a></li>
    </ul>

    <ul>
      <li><h3>VIEW THE STATISTICS</h3></li>
      <li><a href="#">Global numbers</a></li>
      <li><a href="#">Taxonomic coverage</a></li>
      <li><a href="#">Providers</a></li>
      <li><a href="#">Countries</a></li>
    </ul>

    <ul class="last">
      <li><h3>JOIN THE COMMUNITY</h3></li>
      <li><a href="#">Create a new account</a></li>
      <li><a href="#">Share your data</a></li>
      <li><a href="#">Terms and Conditions</a></li>
      <li><a href="#">About</a></li>
    </ul>

  </div>
  </footer>

  <div class="contact_footer">
    <div class="inner">
      <!--<p>2012 &copy; GBIF. Data publishers retain all rights to data.</p>-->
      <div class="copyright">
        <div class="logo"></div>
        <p>2011 © GBIF</p>
      </div>

      <div class="address">
        <h3>GBIF Secretariat</h3>

        <address>
          Universitetsparken 15<br />
          DK-2100 Copenhagen Ø<br />
          DENMARK
        </address>
      </div>

      <div class="contact">
        <h3>Contact</h3>
        <ul>
          <li><strong>Email</strong> info@gbif.org</li>
          <li><strong>Tel</strong> +45 35 32 14 70</li>
          <li><strong>Fax</strong> +45 35 32 14 80</li>
        </ul>
        <p>
        You can also check the <a href="#">GBIF Directory</a>
        </p>

      </div>


    </div>
  </div>

  <!-- JavaScript at the bottom for fast page loading -->
  <!-- scripts concatenated and minified via ant build script  -->
  <script type="text/javascript" src="<?php print ($dataportal_base_url); ?>/js/vendor/jquery-ui-1.8.17.min.js"></script>
  <script type="text/javascript" src="<?php print ($dataportal_base_url); ?>/js/vendor/jscrollpane.min.js"></script>
  <script type="text/javascript" src="<?php print ($dataportal_base_url); ?>/js/vendor/jquery.dropkick-1.0.0.js"></script>
  <script type="text/javascript" src="<?php print ($dataportal_base_url); ?>/js/vendor/jquery.uniform.min.js"></script>
  <script type="text/javascript" src="<?php print ($dataportal_base_url); ?>/js/vendor/mousewheel.js"></script>
  <script type="text/javascript" src="<?php print ($dataportal_base_url); ?>/js/vendor/jscrollpane.min.js"></script>
  <script type="text/javascript" src="<?php print ($dataportal_base_url); ?>/js/vendor/jquery-scrollTo-1.4.2-min.js"></script>
  <script type="text/javascript" src="<?php print ($dataportal_base_url); ?>/js/vendor/bootstrap.min.js"></script>
  <script type="text/javascript" src="<?php print ($dataportal_base_url); ?>/js/vendor/underscore-min.js"></script>
  <script type="text/javascript" src="<?php print ($dataportal_base_url); ?>/js/helpers.js"></script>
  <script type="text/javascript" src="<?php print ($dataportal_base_url); ?>/js/widgets.js"></script>
  <script type="text/javascript" src="<?php print ($dataportal_base_url); ?>/js/graphs.js"></script>
  <script type="text/javascript" src="<?php print ($dataportal_base_url); ?>/js/app.js"></script>
  <script type="text/javascript" src="<?php print ($dataportal_base_url); ?>/js/vendor/raphael-min.js"></script>
  <script type="text/javascript" src="<?php print ($dataportal_base_url); ?>/js/vendor/resourcebundle.js"></script>
  <!-- end scripts-->

  <!--[if lt IE 7 ]>
  <script src="<?php print ($base_url); ?>/js/libs/dd_belatedpng.js"></script>
  <script>DD_belatedPNG
    .fix("img, .png_bg"); // Fix any <img> or .png_bg bg-images. Also, please read goo.gl/mZiyb </script>
  <![endif]-->

  <!-- keep this javascript here so we can use the s.url tag -->
  <script type="text/javascript">
    $(function() {
      $('nav ul li a.more').bindLinkPopover({
        links:{
          "Countries":"/portal/country",
          "GBIF Network":"/portal/member",
          "Themes":"/portal/theme",
          "Statistics":"/portal/stats",
          "About":"http://staging.gbif.org/drupal/about"
        }
      });
    });
  </script>


