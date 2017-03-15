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
          <a href="<?php echo $edit; ?>" class="btn btn-primary"><i class="fa m-r-10 fa-user" aria-hidden="true"></i><?php echo $text_my_account; ?></a>
        </div>
        <div class="btn-group" role="group">
          <a href="<?php echo $order; ?>" class="btn btn-link"><i class="fa m-r-10 fa-shopping-cart" aria-hidden="true"></i><?php echo $text_my_orders; ?></a>
        </div>
        <div class="btn-group" role="group">
          <a href="<?php echo $wishlist; ?>" class="btn btn-link"><i class="fa m-r-10 fa-heart" aria-hidden="true"></i> <?php echo $text_wishlist; ?></a>
        </div>
        <div class="btn-group" role="group">
          <a href="<?php echo $download; ?>" class="btn btn-link"><i class="fa m-r-10 fa-download" aria-hidden="true"></i><?php echo $text_download; ?></a>
        </div>
      </div>
      <div class="well p-a-35 col-lg-6 col-xs-12 col-md-12">
            
        <h3 class="text-uppercase m-b-60 text-theme"><?php echo $text_password; ?></h3>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
          <fieldset>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
              <div class="col-sm-10">
                <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                <?php if ($error_password) { ?>
                <div class="text-danger"><?php echo $error_password; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
              <div class="col-sm-10">
                <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
                <?php if ($error_confirm) { ?>
                <div class="text-danger"><?php echo $error_confirm; ?></div>
                <?php } ?>
              </div>
            </div>
          </fieldset>
          <div class="buttons clearfix m-t-30">
            <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-border m-w-200 border-radius-large"><?php echo $button_back; ?></a></div>
            <div class="pull-right">
              <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary m-w-200 border-radius-large" />
            </div>
          </div>
        </form>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>