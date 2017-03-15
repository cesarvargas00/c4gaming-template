<div class="row">
  <?php foreach ($products as $product) { ?>
  <div class="product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12">
    <?php require( DIR_TEMPLATE . 'c4_game/template/product/product_item.tpl'); ?>
  </div>
  <?php } ?>
</div>
<div class="row">
  <div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
</div>