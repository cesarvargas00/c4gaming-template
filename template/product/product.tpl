<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="row m-b-30">
        <?php if ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-7'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          
          <div class="row">
              <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                <?php if ($thumb || $images) { ?>
                  <ul class="thumbnails list-unstyled list-images">
                    <?php if ($images) { ?>
                    <?php foreach ($images as $image) { ?>
                    <li class="image-additional">
                      <a class="img-responsive" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class="img-responsive" />
                      </a>
                    </li>
                    <?php } ?>
                    <?php } ?>
                  </ul>
                  <?php } ?>
              </div>
              <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                <div class="image-show">
                  <?php if (isset($images[0])) { ?>
                  <!-- <a class="" href="<?php echo $images[0]['popup']; ?>" title="<?php echo $heading_title; ?>"> -->
                    <img src="<?php echo $images[0]['popup']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class="img-responsive" />
                  <!-- </a> -->
                  <?php } else { ?>
                  
                  <!-- <a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"> -->
                    <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                  <!-- </a> -->
                  <?php } ?>
                </div>
              </div>       
          </div>      
        </div>
        <?php if ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-5'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          
          <div class="special text-theme text-uppercase m-b-40 hidden">
            <span class="font-size-15 font-weight-700 m-r-15">a promoção acaba em</span> <span class="count font-size-33 font-weight-700">00:36:21</span>
          </div>

          <h1 class="prodcut-name m-b-25"><?php echo $heading_title; ?></h1>
          
          <!-- rating -->
          <?php if ($review_status) { ?>
          <div class="rating m-b-20">
            <p>
              <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($rating < $i) { ?>
              <i class="fa fa-star m-r-5 text-no-review"></i>
              <?php } else { ?>
              <i class="fa fa-star m-r-5 text-theme"></i>
              <?php } ?>
              <?php } ?>
          </div>
          <?php } ?>

          <ul class="list-inline list-check m-b-20">
            <li><i class="fa fa-check" aria-hidden="true"></i> <?php echo $stock; ?></li>
            <li><i class="fa fa-lock" aria-hidden="true"></i> Em estoque</li>
          </ul>

          <?php if ($price) { ?>
          <ul class="list-inline">
            
            <?php if($percents_price){ ?>
            <li><span class="btn btn-primary btn-sm border-radius-large m-t--20"><?php echo round($percents_price, 1) . "%"; ?></span></li>
            <?php } ?>

            <?php if (!$special) { ?>
            <li>
              <h2 class="price"><?php echo $price; ?></h2>
            </li>
            <?php } else { ?>
            <li>
              <h2 class="price"><?php echo $special; ?></h2>
            </li>
            <li><span class="price-special" style="text-decoration: line-through;"><?php echo $price; ?></span></li>
            <?php } ?>
          </ul>
          <?php } ?>
          <div id="product">
            
            <?php if ($recurrings) { ?>
            <hr>
            <h3><?php echo $text_payment_recurring; ?></h3>
            <div class="form-group required">
              <select name="recurring_id" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($recurrings as $recurring) { ?>
                <option value="<?php echo $recurring['recurring_id']; ?>"><?php echo $recurring['name']; ?></option>
                <?php } ?>
              </select>
              <div class="help-block" id="recurring-description"></div>
            </div>
            <?php } ?>
            <div class="form-group">
              <div class="hidden">
                <label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
                <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
              </div>
              <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
              <br />
              <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg border-radius-large"><?php echo $button_cart; ?></button>
              
              <button type="button" data-toggle="tooltip" class="btn btn-link" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i> <?php echo $button_wishlist; ?></button>

            </div>
            <?php if ($minimum > 1) { ?>
            <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
            <?php } ?>
          </div>
          
        </div>
      </div>

      <div class="row">
        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
          <!-- DLCs -->
          <div id="options" class="panel panel-default panel-options">
            <div class="panel-body">
              <?php if ($options) { ?>
            <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
                </option>
                <?php } ?>
              </select>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'radio') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php if ($option_value['image']) { ?>
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                    <?php } ?>                    
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'checkbox') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php if ($option_value['image']) { ?>
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                    <?php } ?>

                    <span>
                      <?php echo $option_value['name']; ?>
                      <?php if ($option_value['price']) { ?>
                      <br>
                      <?php echo $option_value['price']; ?>
                      <?php } ?>
                    </span>
                    
                  </label>
                </div>
                <hr>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'text') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'textarea') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'date') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group date">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'datetime') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group datetime">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'time') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group time">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            </div>
          </div>

          <!-- Description -->
          <div class="panel panel-default panel-description">
            <div class="panel-heading">
              <h3 class="panel-title text-uppercase">DEscrição</h3>
            </div>
            <div class="panel-body">
              <?php echo $description; ?>
            </div>
          </div>

          <!-- Attributes -->
          <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title text-uppercase">Características</h3>
            </div>
            <div class="panel-body">
              
              <?php if ($categories) { ?>
              
              <div class="row m-b-40">
                <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                  <h4 class="attribute-group-name">Categoria</h4>
                </div>
                <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
                  <ul class="list-inline list-category">
                    <?php foreach ($categories as $key => $category) { ?>
                    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['text']; ?></a></li>
                    <?php } ?>
                  </ul>
                </div>
              </div>

              <?php } ?>

              <?php if ($manufacturer) { ?>
              <div class="row m-b-40">
                <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                  <h4 class="attribute-group-name"><?php echo $text_manufacturer; ?></h4>
                </div>
                <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7 list-attribute">
                  <img class="img-responsive pull-left m-r-10" width="20" src="<?php echo "image/" . $manufacturers_image; ?>" alt="<?php echo $text_manufacturer; ?>">
                  <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a>
                </div>
              </div>
              <?php } ?>

              <?php foreach ($attribute_groups as $attribute_group) { ?>
              <div class="row m-b-40">
                <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5">
                  <h4 class="attribute-group-name"><?php echo $attribute_group['name']; ?></h4>
                </div>
                <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
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

          <!-- Reviews -->
          <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title text-uppercase">Avaliações</h3>
            </div>
            <div class="panel-body">
              <div class="tab-pane" id="tab-review">
              <form class="form-horizontal" id="form-review">
                <div id="review"></div>
                <h3 class="text-center"><?php echo $text_write; ?></h3>
                <?php if ($review_guest) { ?>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                    <div class="help-block"><?php echo $text_note; ?></div>
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12">
                    <label class="control-label"><?php echo $entry_rating; ?></label>
                    &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                    <input type="radio" name="rating" value="1" />
                    &nbsp;
                    <input type="radio" name="rating" value="2" />
                    &nbsp;
                    <input type="radio" name="rating" value="3" />
                    &nbsp;
                    <input type="radio" name="rating" value="4" />
                    &nbsp;
                    <input type="radio" name="rating" value="5" />
                    &nbsp;<?php echo $entry_good; ?></div>
                </div>
                <?php echo $captcha; ?>
                <div class="buttons clearfix">
                  <div class="pull-right">
                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                  </div>
                </div>
                <?php } else { ?>
                <div class="text-center"><?php echo $text_login; ?></div>
                <?php } ?>
              </form>
            </div>
            </div>
          </div>
        </div>

        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
          
          <!-- payment -->
          <!--
          <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title text-uppercase">Parcelamento</h3>
            </div>
            <div class="panel-body">
              <img class="img-responsive m-b-30" src="image/catalog/payment-large.png" alt="">
              <h4 class="text-white text-uppercase m-b-20">Sem juros</h4>
              <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                  <ul class="list-double">
                    <li>1x R$ 76,90</li>
                    <li>2x R$ 38,45</li>
                    <li>3x R$ 25,63</li>
                    <li>4x R$ 19,22</li>
                    <li>5x R$ 15,38</li>
                    <li>6x R$ 12,81</li>
                  </ul>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                  <ul class="list-double">
                    <li>7x R$ 10,98</li>
                    <li>8x R$ 9,61</li>
                    <li>9x R$ 8,54</li>
                    <li>10x R$ 7,69</li>
                    <li>11x R$ 6,99</li>
                    <li>12x R$ 6,40</li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          -->
          <?php 
            if(boolval($shipping))
            {
          ?>
              <!-- Frete -->
              <div class="panel panel-default panel-prete">
                <div class="panel-heading">
                  <h3 class="panel-title text-uppercase">Frete</h3>
                </div>
                <div class="panel-body">
                  <div class="m-b-10">Insira seu CEP</div>
                  <button class="btn btn-white border-radius-large">18055 - 320</button>
                  <button class="btn btn-primary border-radius-large">Calcular</button>
                  
                  <h4 class="text-white text-uppercase m-b-20 m-t-30">Sem juros</h4>
                  <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                      <span class="text-dark">R$ 19,80<spam>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                      <span class="text-dark">10-14 dias úteis<spam>
                    </div>
                  </div>
                  <hr>

                  <h4 class="text-white text-uppercase m-b-20">Expressa</h4>
                  <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                      <span class="text-dark">R$ 39,00<spam>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                      <span class="text-dark">3-5 dias úteis<spam>
                    </div>
                  </div>
                  <hr>

                  <h4 class="text-white text-uppercase m-b-20">Agendada</h4>
                  <div class="row">
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                      <span class="text-dark">R$ 42,30<spam>
                    </div>
                    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                      <span class="text-dark">14-21 dias úteis<spam>
                    </div>
                  </div>

                </div>
              </div>
          <?php } ?>  

          <!-- Social -->
          <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title text-uppercase">Prazo de entrega</h3>
            </div>
            <div class="panel-body">
              
              <div class="row">
                <div class="col-xs-2">
                  <i class="fa fa-clock-o fa-2x" aria-hidden="true"></i>
                </div>
                <div class="col-xs-10">
                  <div class="text-white text-uppercase">Entrega Inst&acirc;ntenea</div>
                  <span style="font-size: 11px !important; color:#626262" class="text-uppercase">
                    D&ecirc; 5 minutos a 1 hora ap&oacute;s a confirma&ccedil;&atilde;o do pagamento
                  </span>
                </div>

              </div>

            </div>
          </div>

          <!-- Social -->
          <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title text-uppercase">Compartilhe</h3>
            </div>
            <div class="panel-body">
              
              <!-- AddThis Button BEGIN -->
              <div class="addthis_toolbox addthis_default_style" data-url="<?php echo $share; ?>">
                <a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
                <a class="addthis_button_tweet"></a>
              </div>
              <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script>
              <!-- AddThis Button END -->

            </div>
          </div>

          <!-- R -->
          <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title text-uppercase">Sistema Operacional</h3>
            </div>
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
                  <div role="tabpanel" class="tab-pane content-require active" id="window"><?php echo $r1; ?></div>
                  <div role="tabpanel" class="tab-pane content-require" id="mac"><?php echo $r2; ?></div>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>

      <?php if ($products) { ?>
      
      <div class="block block-product latest">
        <div class="box-heading text-center">
          <?php echo $text_related; ?>
        </div>
        <div class="box-content">
          <div class="row">
            <?php $i = 0; ?>
            <?php foreach ($products as $product) { ?>
            <?php if ($column_left && $column_right) { ?>
            <?php $class = 'col-xs-8 col-sm-6'; ?>
            <?php } elseif ($column_left || $column_right) { ?>
            <?php $class = 'col-xs-6 col-md-4'; ?>
            <?php } else { ?>
            <?php $class = 'col-xs-6 col-sm-3'; ?>
            <?php } ?>
            <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
              <?php require( DIR_TEMPLATE . 'c4_game/template/product/product_item.tpl'); ?>
            </div>
            <?php if (($column_left && $column_right) && (($i+1) % 2 == 0)) { ?>
            <div class="clearfix visible-md visible-sm"></div>
            <?php } elseif (($column_left || $column_right) && (($i+1) % 3 == 0)) { ?>
            <div class="clearfix visible-md"></div>
            <?php } elseif (($i+1) % 4 == 0) { ?>
            <div class="clearfix visible-md"></div>
            <?php } ?>
            <?php $i++; ?>
            <?php } ?>
          </div>
        </div>
      </div>
      
      <?php } ?>

      <?php if ($tags) { ?>
      <p><?php echo $text_tags; ?>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
      </p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea, #options input[type=\'text\'], #options input[type=\'hidden\'], #options input[type=\'radio\']:checked, #options input[type=\'checkbox\']:checked, #options select, #options textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#cart > a').html('<span id="cart-total"><i class="fa fa-shopping-cart font-size-17"></i> ' + json['total'] + '</span>');

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
});

$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});
//--></script>
<?php echo $footer; ?>
