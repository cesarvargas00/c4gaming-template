<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb hidden">
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
    <div id="content" class="<?php echo $class; ?> m-b-70"><?php echo $content_top; ?>
      <h2 class="text-center text-uppercase m-b-70">Minha Conta</h2>
      
      <div class="btn-group btn-group-justified m-b-70 bg-light" role="group" aria-label="...">
        <div class="btn-group" role="group">
          <a href="<?php echo $edit; ?>" class="btn btn-link"><i class="fa m-r-10 fa-user" aria-hidden="true"></i><?php echo $text_my_account; ?></a>
        </div>
        <div class="btn-group" role="group">
          <a href="<?php echo $order; ?>" class="btn btn-primary"><i class="fa m-r-10 fa-shopping-cart" aria-hidden="true"></i><?php echo $text_my_orders; ?></a>
        </div>
        <div class="btn-group" role="group">
          <a href="<?php echo $wishlist; ?>" class="btn btn-link"><i class="fa m-r-10 fa-heart" aria-hidden="true"></i> <?php echo $text_wishlist; ?></a>
        </div>
        <div class="btn-group" role="group">
          <a href="<?php echo $download; ?>" class="btn btn-link"><i class="fa m-r-10 fa-download" aria-hidden="true"></i><?php echo $text_download; ?></a>
        </div>
      </div>

      <?php if ($orders) { ?>

      
      <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
        
        <?php $i = 0; foreach ($orders as $order) { ?>
        
        <div class="panel-order">
          <div class="panel-heading" role="tab" id="heading<?php echo $order['order_id'] ?>">
            <h4 class="panel-title">
              <span class="pull-left order-id">Pedido nº <?php echo $order['order_id']; ?></span>
              <a class="pull-right epand" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse<?php echo $order['order_id'] ?>" aria-expanded="true" aria-controls="collapse<?php echo $order['order_id'] ?>">
                ocutar <i class="fa fa-angle-down" aria-hidden="true"></i>
              </a>
              <div class="clearfix"></div>
            </h4>
          </div>

          <div class="row text-center m-t-50 m-b-50">
              <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                  <div class="font-size-16 font-weight-700 text-uppercase m-b-10"><?php echo $order['date_added']; ?></div>
                  <div class="font-dark"><?php echo $column_date_added; ?></div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                  <div class="font-size-16 font-weight-700 text-uppercase m-b-10"><?php echo $order['products']; ?></div>
                  <div class="font-dark"><?php echo $column_product; ?></div>
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                  <div class="font-size-16 font-weight-700 text-uppercase m-b-10"><?php echo $order['total']; ?></div>
                  <div class="font-dark"><?php echo $column_total; ?></div>
                </div>
              </div>

          <hr>

          <div id="collapse<?php echo $order['order_id'] ?>" class="panel-collapse collapse <?php if ($i == 0) { echo "in"; }; ?>" role="tabpanel" aria-labelledby="heading<?php echo $order['order_id'] ?>">
            <div class="panel-body">
            
              <?php foreach ($order['products_order'] as $product) { ?>
              
              <div class="row">
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                  <img class="img-responsive" src="<?php echo $product['image']; ?>" alt="">
                </div>
                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                  <div class="font-size-16 font-weight-700 m-t-20"><?php echo $product['name']; ?></div>
                </div>
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                  <div class="font-size-12 font-weight-700 m-t-20"><?php echo $product['price']; ?></div>
                </div>
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                  <div class="font-size-12 font-weight-700 m-t-20"><?php echo $product['quantity']; ?></div>
                </div>
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                  <div class="font-size-12 font-weight-700 m-t-20"><?php echo $product['total']; ?></div>
                </div>
              </div>
              <hr>
              <?php } ?>

              <div class="row text-center font-size-14 font-weight-700 text-theme text-uppercase m-b-50 m-t-50">
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                  <div>Produtos Digitais</div>
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                  <div>Entrega</div>
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                  <div>Pagamento</div>
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                  <div>total do pedido</div>
                </div>
              </div>

              <div class="row text-center">
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                  <a href="<?php echo $download; ?>" class="btn btn-primary border-radius-large p-l-30 p-r-30"><?php echo $text_download; ?></a>
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                  <?php echo $order['shipping_method']; ?>
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                  <?php echo $order['payment_method']; ?>
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                  <table class="table table-bordered table-no-border">
                    <?php foreach ($order['totals'] as $total) { ?>
                    <tr>
                      <td class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
                      <td class="text-right"><?php echo $total['text']; ?></td>
                    </tr>
                    <?php } ?>
                  </table>
                </div>
              </div>

            </div>
          </div>
        </div>
        <?php $i++; } ?>
      </div>

      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right hidden"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
