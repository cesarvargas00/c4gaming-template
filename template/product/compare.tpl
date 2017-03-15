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
      <h1 class="text-center m-b-70"><?php echo $heading_title; ?></h1>
      <?php if ($products) { ?>
      
      <?php $col = 12 / count($products); ?> 

      <div class="row">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-compare col-xs-<?php echo $col; ?>">
          <div class="product-thumb transition m-b-30">

            <div class="row">
              <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                <div class="image"><a href="<?php echo $product['href']; ?>"><img width="210" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
              </div>
              <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 p-l-5">
                <div class="caption clearfix">
                  <div class="name m-b-10"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
                  
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

                  <?php if ($product['price']) { ?>
                  <p class="price">
                    <?php if (!$product['special']) { ?>
                    <span class="price-new btn-sm"><?php echo $product['price']; ?></span>
                    <?php } else { ?>
                    <span class="price-new btn-sm m-b-15"><?php echo $product['special']; ?></span>
                    <span class="price-old text-center"><?php echo $product['price']; ?></span> 
                    <?php } ?>
                  </p>
                  <?php } ?>
                </div>

                <button type="button" class="btn btn-primary border-radius-large btn-lg" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span></button>

              </div>
            </div> 
          </div>

          <!-- description -->
          <div class="well description m-b-30 panel-description">
            <h3 class="text-uppercase text-theme"><?php echo $text_summary; ?></h3>
            <div class="panel-body"><?php echo $product['description']; ?></div>
          </div>

          <!-- Attributes -->
          <div class="well m-b-30">

            <h3 class="text-uppercase text-theme">Características</h3>

            <div class="panel-body">

              <?php if ($product['categories']) { ?>
              
              <div class="row m-b-40">
                <div class="col-xs-4">
                  <h4 class="attribute-group-name">Categoria</h4>
                </div>
                <div class="col-xs-8">
                  <ul class="list-inline list-category">
                    <?php foreach ($product['categories'] as $key => $category) { ?>
                    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['text']; ?></a></li>
                    <?php } ?>
                  </ul>
                </div>
              </div>

              <?php } ?>
              
              <?php foreach ($product['attribute_groups'] as $attribute_group) { ?>
              <div class="row m-b-40">
                <div class="col-xs-4">
                  <h4 class="attribute-group-name"><?php echo $attribute_group['name']; ?></h4>
                </div>
                <div class="col-xs-8">
                  <ul class="list-inline list-attribute">
                  <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                  <li title="<?php echo $attribute['name']; ?>"><?php echo html_entity_decode($attribute['text']); ?></li>
                  <?php } ?>
                  </ul>
                </div>
              </div>
              <?php } ?>

            </div>
          </div>
          
          <!-- Ev -->
          <div class="well m-b-30">
            <h3 class="text-theme text-uppercase">Requisitos mínimos</h3>
            <div class="panel-body">
              <div role="tabpanel">
                <!-- Nav tabs -->
                <ul class="nav nav-pills m-b-40" role="tablist">
                  <li role="presentation" class="active">
                    <a class="font-size-16 p-l-0" href="#window" aria-controls="window" role="tab" data-toggle="tab">
                      <i class="fa fa-windows m-r-5"></i> WINDOWS
                    </a>
                  </li>
                  <li role="presentation">
                    <a class="font-size-16" href="#mac" aria-controls="mac" role="tab" data-toggle="tab">
                      <i class="fa fa-apple m-r-5"></i> MAC
                    </a>
                  </li>
                </ul>
              
                <!-- Tab panes -->
                <div class="tab-content content-require">
                  <div role="tabpanel" class="tab-pane content-require active" id="window"><?php echo $product['r1']; ?></div>
                  <div role="tabpanel" class="tab-pane content-require" id="mac"><?php echo $product['r2']; ?></div>
                </div>
              </div>
            </div>
          </div>

          <div class="well" style="min-height: auto">
            <a href="<?php echo $product['remove']; ?>" class="btn btn-danger btn-block"><?php echo $button_remove; ?></a>
          </div>

        </div>

        
        <?php } ?>
      </div>

      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-default"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
