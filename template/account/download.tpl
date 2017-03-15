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
          <a href="<?php echo $wishlist; ?>" class="btn btn-link"><i class="fa m-r-10 fa-heart" aria-hidden="true"></i> <?php echo $text_wishlist; ?></a>
        </div>
        <div class="btn-group" role="group">
          <a href="<?php echo $download; ?>" class="btn btn-primary"><i class="fa m-r-10 fa-download" aria-hidden="true"></i><?php echo $text_download; ?></a>
        </div>
      </div>



      <?php if ($downloads) { ?>
      <div class="block block-product latest">
        <div class="box-content">
          <div class="row">
            <?php foreach ($downloads as $download) { ?>
            <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
              
              <div class="product-block transition text-center">
                <div class="image m-b-20"><img src="<?php echo $download['image']; ?>" alt="<?php echo $download['name']; ?>" title="<?php echo $download['name']; ?>" class="img-responsive" /></div>
                <div class="caption">
                  <div class="name m-b-15 p-l-20 p-r-20"><span style="font-weight: bold !important; font-size: 16px !important;"><?php echo $download['name']; ?></span></div>
                   <div class="m-b-20">
                  		<span class="text-uppercase">número de série:</span>
                  		<br>
                  		<span class="text-uppercase"><?php echo $download['serial']; ?></span>
                	</div>
                	<?php if ($download['mode'] == 1) { ?>
                	<div class="m-b-20">
                  		<span class="text-uppercase">Gerenciador de downloads</span>
                	</div>
                	
                	
                	<?php } else { ?>
                	<div class="m-b-20">
                  		<span class="text-uppercase">Steam</span>
                  	</div>
                	
                	<?php } ?>
                <div class="team m-b-20">
                  		<span class="text-uppercase">Expiração:</span>
                  		<span class="text-uppercase"><?php echo $download['expire_date']; ?></span>
                	</div>	
                  <?php if (isset($download['rating'])) { ?>
                  <div class="rating m-b-15">
                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                    <?php if ($download['rating'] < $i) { ?>
                    <i class="fa fa-star"></i>
                    <?php } else { ?>
                    <i class="fa fa-star text-theme"></i>
                    <?php } ?>
                    <?php } ?>
                  </div>
                  <?php } ?>
                </div>
                  <a target="_blank" class="btn btn-primary p-r-35 p-l-35 border-radius-large" href="<?php echo $download['link']; ?>" data-toggle="tooltip" title="<?php echo $button_download; ?>" class="btn btn-primary"><i class="fa fa-cloud-download"></i> Download</a>

              </div>

            </div>
            <?php } ?>
          </div>
        </div>
      </div>

      <div class="table-responsive hidden">
      <table class="table table-bordered table-hover">
        <thead>
          <tr>
            <td class="text-right"><?php echo $column_order_id; ?></td>
            <td class="text-left"><?php echo $column_name; ?></td>
            <td class="text-left"><?php echo $column_size; ?></td>
            <td class="text-left"><?php echo $column_date_added; ?></td>
            <td></td>
          </tr>
        </thead>
        <tbody>
          <?php foreach ($downloads as $download) { ?>
          <tr>
            <td class="text-right"><?php echo $download['order_id']; ?></td>
            <td class="text-left"><?php echo $download['name']; ?></td>
            <td class="text-left"><?php echo $download['size']; ?></td>
            <td class="text-left"><?php echo $download['date_added']; ?></td>
            <td><a href="<?php echo $download['href']; ?>" data-toggle="tooltip" title="<?php echo $button_download; ?>" class="btn btn-primary"><i class="fa fa-cloud-download"></i></a></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      </div>
      <div class="row m-b-20">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix m-b-70">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>