<?php

ini_set('display_startup_errors',1);
ini_set('display_errors',1);
error_reporting(-1);
?>
<div class="product-block transition text-center">
  <div class="image m-b-20"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
  <div class="caption">
    <div class="name m-b-15 p-l-20 p-r-20"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
    <?php if (isset($product['rating'])) { ?>
    <div class="rating m-b-15">
      <?php for ($i = 1; $i <= 5; $i++) { ?>
      <?php if ($product['rating'] < $i) { ?>
      <i class="fa fa-star"></i>
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

    <?php if (false){ ?>
    <div class="team">
      <img height="18" src="<?php echo $product['manufacturer_image_normal']; ?>" alt="<?php echo $product['manufacturer_name']; ?>">
      <span class="text-uppercase"><?php echo $product['manufacturer_name']; ?></span>
    </div>
    <?php } ?>

  </div>

    <?php  if ($product['discount'] > 0) {  ?>
      <button data-special="-<?php echo $product['discount'] ?>%" type="button" class="btn btn-primary p-r-35 p-l-35 border-radius-large btn-special" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
    <?php } else { ?>  
      <button type="button" class="btn btn-primary p-r-35 p-l-35 border-radius-large" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span></button>
   <?php } ?>
    <div class="action">
      <button class="btn btn-primary btn-sm m-b-10" type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i><?php echo $button_wishlist; ?></button>
      <button class="btn btn-default btn-sm" type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><?php echo $button_compare; ?></i></button>
    </div>
</div>