<div class="block block-product latest">
  <div class="box-heading text-center"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <div class="row">
      <?php foreach ($products as $product) { ?>
      <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
        <?php require( DIR_TEMPLATE . 'c4_game/template/product/product_item.tpl'); ?>
      </div>
      <?php } ?>
    </div>
  </div>
</div>
