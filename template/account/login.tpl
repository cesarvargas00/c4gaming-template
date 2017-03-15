<?php echo $header; ?>
<div class="container p-t-90">
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> m-t-30"><?php echo $content_top; ?>
      <div class="row">
        <div class="col-sm-12">
          <div class="well login-from m-b-75">

            <div class="font-size-19 text-uppercase text-theme font-weight-700 m-b-60"><?php echo $text_login; ?></div>

            <div class="row m-b-50">
              <!--<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">        
 <a href="<?php echo $advancedlogin_url; ?>" class="btn btn-facebook btn-block border-radius-large"><i class="fa fa-facebook" aria-hidden="true"></i> login com facebook</a>
              </div>-->
		<div class="col-sm-3 col-md-3 col-lg-3 col-xs-3"></div>
              <div class=" col-xs-6 col-sm-6 col-md-6 col-lg-6">
                <a href="<?php echo $advancedlogin_gurl; ?>" class="btn btn-google btn-block border-radius-large"><i class="fa fa-google-plus" aria-hidden="true"></i> login com google+</a>
              </div>
            </div>

            <div class="hr m-b-30"></div>
            
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
              <div class="form-group m-b-30">
                <label class="control-label text-uppercase" for="input-email"><?php echo $entry_email; ?></label>
                <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
              </div>
              <div class="form-group m-b-30">
                <label class="control-label text-uppercase" for="input-password"><?php echo $entry_password; ?></label>
                <div class="form-password">
                <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                <a class="resest" href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></div>
                </div>
              <input type="submit" value="<?php echo $button_login; ?>" class="btn btn-primary border-radius-large btn-login m-r-25" />
              <a href="<?php echo $register; ?>" class="btn btn-border border-radius-large btn-login">criar minha conta</a>
              <?php if ($redirect) { ?>
              <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
              <?php } ?>
            </form>
          </div>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
