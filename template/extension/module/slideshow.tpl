<div id="slideshow<?php echo $module; ?>" class="owl-carousel slideshow" style="opacity: 1;">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>

    <?php if ($product = $banner['product']) { ?>
      <div class="product-slideshow">

        <div class="product-heading font-size-13 text-theme text-uppercase m-b-25"><?php echo $banner['title']; ?></div>

        <div class="name m-b-35"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>

        <?php if ($product['price']) { ?>
        <p class="price m-b-45">
          <?php if (!$product['special']) { ?>
          <span class="price-new"><?php echo $product['price']; ?></span>
          <?php } else { ?>
          <span class="price-old m-r-15"><?php echo $product['price']; ?></span>
          <span class="price-new"><?php echo $product['special']; ?></span> 
          <?php } ?>
        </p>
        <?php } ?>

        <button class="btn btn-primary btn-lg border-radius-large" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><?php echo $button_cart; ?></button>

      </div>
    <?php } ?>

  </div>
  <?php } ?>
</div>
<script type="text/javascript"><!--
$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: 6,
	autoPlay: false,
	singleItem: true,
	navigation: true,
	navigationText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
	pagination: false
});
--></script>