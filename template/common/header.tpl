<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/theme/c4_game/stylesheet/bootstrap.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Lato:300,400,700,900|Open+Sans:400,700" rel="stylesheet">
<link href="catalog/view/theme/c4_game/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
<!-- Facebook Pixel Code -->
<script>
!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
document,'script','https://connect.facebook.net/en_US/fbevents.js');
fbq('init', '252101748576789'); // Insert your pixel ID here.
fbq('track', 'PageView');
</script>
<noscript><img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=252101748576789&ev=PageView&noscript=1"
/></noscript>
<!-- DO NOT MODIFY -->
<!-- End Facebook Pixel Code -->
</head>
<body class="<?php echo $class; ?> effect-left-push effect-right-push">

<div class="dtn-content">
  <header class="header">
    <div class="container-fluid">
      <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">

          <span data-open="is-left-open" class="toggle-offcanvas close-offcanvas left hidden-lg hidden-md">
            <i class="fa fa-bars fa-2x" aria-hidden="true"></i>
          </span>

          <span data-open="is-right-open" class="toggle-offcanvas close-offcanvas right hidden-lg hidden-md">
            <i class="fa fa-user fa-2x" aria-hidden="true"></i>
          </span>

          <div id="logo" class="logo">
            <?php if ($logo) { ?>
            <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
            <?php } else { ?>
            <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
            <?php } ?>
          </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 hidden-xs hidden-sm">

        <?php if ($categories) { ?>
        <nav id="menu" class="navbar">
          <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
            <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
          </div>
          <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav">
              <?php foreach ($categories as $category) { ?>
              <?php if ($category['children']) { ?>
              <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?> <i class="fa fa-angle-down font-size-16 font-weight-700 m-l-5" aria-hidden="true"></i></a>
                <div class="dropdown-menu">
                  <div class="dropdown-inner">
                    <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                    <ul class="list-unstyled">
                      <?php foreach ($children as $child) { ?>
                      <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                      <?php } ?>
                    </ul>
                    <?php } ?>
                  </div>
                  <a href="<?php echo $category['href']; ?>" class="see-all">Exibir todos os <?php echo $category['name']; ?></a> </div>
              </li>
              <?php } else { ?>
              <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
              <?php } ?>
              <?php } ?>
              <li><a target="_blank" href="http://comunidade.c4gaming.com.br">COMUNIDADE</a></li>

            </ul>
          </div>
        </nav>
        <?php } ?>

        </div>
        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 header-right p-y-10 hidden-xs hidden-sm header-account">

          <div class="dropdown pull-right">
            <a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle text-uppercase" data-toggle="dropdown">
              <img src="<?php echo $avatar ?>" width="33" height="33" alt="" class="m-r-10 border-radius-100">
              <?php echo $text_account; ?>
              <i class="fa fa-angle-down font-size-16 font-weight-700 m-l-5" aria-hidden="true"></i>
            </a>
            <ul class="dropdown-menu dropdown-menu-right account-link m-t-15 arrow">
              <?php if ($logged) { ?>
              <li><a href="<?php echo $account; ?>"><i class="fa fa-user m-r-5" aria-hidden="true"></i><?php echo $text_account; ?></a></li>
              <li><a href="<?php echo $order; ?>"><i class="fa fa-cart-plus m-r-5" aria-hidden="true"></i><?php echo $text_order; ?></a></li>
              <li class="hidden"><a href="<?php echo $transaction; ?>"><i class="fa fa-truck m-r-5" aria-hidden="true"></i><?php echo $text_transaction; ?></a></li>
              <li><a href="<?php echo $download; ?>"><i class="fa fa-arrow-down m-r-5" aria-hidden="true"></i><?php echo $text_download; ?></a></li>
              <li><a href="<?php echo $logout; ?>"><i class="fa fa-sign-in m-r-5" aria-hidden="true"></i><?php echo $text_logout; ?></a></li>
              <?php } else { ?>
              <li><a href="<?php echo $register; ?>"><i class="fa fa-sign-out m-r-5" aria-hidden="true"></i><?php echo $text_register; ?></a></li>
              <li><a href="<?php echo $login; ?>"><i class="fa fa-sign-in m-r-5" aria-hidden="true"></i><?php echo $text_login; ?></a></li>
              <?php } ?>
            </ul>
          </div>

          <?php echo $cart; ?>
          <?php echo $search; ?>

        </div>
      </div>
    </div>
  </header>

