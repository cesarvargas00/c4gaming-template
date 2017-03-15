<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb hidden">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2 class="text-center text-uppercase m-b-70">Minha Conta</h2>

      <div class="btn-group btn-group-justified m-b-70 bg-light" role="group" aria-label="...">
        <div class="btn-group" role="group">
          <a href="<?php echo $edit; ?>" class="btn btn-link"><i class="fa m-r-10 fa-user" aria-hidden="true"></i><?php echo $text_my_account; ?></a>
        </div>
        <div class="btn-group" role="group">
          <a href="<?php echo $order; ?>" class="btn btn-link"><i class="fa m-r-10 fa-shopping-cart" aria-hidden="true"></i><?php echo $text_my_orders; ?></a>
        </div>
        <div class="btn-group" role="group">
          <a href="<?php echo $wishlist; ?>" class="btn btn-primary"><i class="fa m-r-10 fa-heart" aria-hidden="true"></i> <?php echo $text_wishlist; ?></a>
        </div>
        <div class="btn-group" role="group">
          <a href="<?php echo $download; ?>" class="btn btn-link"><i class="fa m-r-10 fa-download" aria-hidden="true"></i><?php echo $text_download; ?></a>
        </div>
      </div>

      <?php if ($products) { ?>
      <div class="block block-product latest m-b-80">
        <div class="box-content">
          <div class="row">
            <?php foreach ($products as $product) { ?>
            <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
              
              <div class="product-block transition text-center">
                <div class="image m-b-20"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                <div class="caption">
                  <div class="name m-b-15 p-l-20 p-r-20"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                  <?php if (isset($product['rating'])) { ?>
                  <div class="rating m-b-15">
                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                    <?php if ($product['rating'] < $i) { ?>
                    <i class="fa m-r-10 fa-star"></i>
                    <?php } else { ?>
                    <i class="fa fa-star text-theme"></i>
                    <?php } ?>
                    <?php } ?>
                  </div>
                  <?php } ?>
                  <?php if ($product['price']) { ?>
                  <p class="price">
                    <?php if (!$product['special']) { ?>
                    <span class="price-new m-b-10"><?php echo $product['price']; ?></span>
                    <?php } else { ?>
                    <span class="price-new m-b-10"><?php echo $product['special']; ?></span><br>
                    <span class="price-old m-b-10"><?php echo $product['price']; ?></span>
                    <?php } ?>
                  </p>
                  <?php } ?>

                  <?php if ($product['manufacturer_name']){ ?>
                  <div class="team">
                    <img height="18" src="<?php echo $product['manufacturer_image_normal']; ?>" alt="<?php echo $product['manufacturer_name']; ?>">
                    <span class="text-uppercase"><?php echo $product['manufacturer_name']; ?></span>
                  </div>
                  <?php } ?>

                </div>

                  <button type="button" class="btn btn-primary p-r-35 p-l-35 border-radius-large" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>

                  <div class="action">
                    <a class="btn btn-primary btn-sm m-b-10" href="<?php echo $product['remove']; ?>"><i class="fa fa-times m-r-10" aria-hidden="true"></i><?php echo $button_remove; ?></a>
                  </div>
              </div>

            </div>
            <?php } ?>
          </div>
        </div>
      </div>

      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix hidden">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>