
<div class="box feature">
  <div class="row">
    <?php foreach ($products as $product) { ?>
    <div class="product-layout col-lg-4 col-md-4 col-sm-12 col-xs-12">
      <div class="product-thumb transition">

        <div class="row">
          <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
          </div>
          <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 p-l-5">
            <div class="caption clearfix">
              <div class="name pull-left m-b-25"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
              <?php if ($product['price']) { ?>
              <p class="price pull-right">
                <?php if (!$product['special']) { ?>
                <span class="price-new btn btn-primary btn-sm border-radius-large"><?php echo $product['price']; ?></span>
                <?php } else { ?>
                <span class="price-new btn btn-primary btn-sm m-b-15 border-radius-large"><?php echo $product['special']; ?></span> <br> 
                <span class="price-old text-center show"><?php echo $product['price']; ?></span> 
                <?php } ?>
              </p>
              <?php } ?>
            </div>

            <?php if (isset($product['rating'])) { ?>
              <div class="rating m-b-20">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($product['rating'] < $i) { ?>
                <i class="fa fa-star"></i>
                <?php } else { ?>
                <i class="fa fa-star text-theme"></i>
                <?php } ?>
                <?php } ?>
              </div>
            <?php } ?>

            <button type="button" class="btn btn-primary border-radius-large" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span></button>

          </div>
        </div>
        
      </div>
    </div>
    <?php } ?>
  </div>
</div>