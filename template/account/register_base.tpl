<?php echo $header; ?>
<div class="container">
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
    <div id="content" class="<?php echo $class; ?> p-t-90"><?php echo $content_top; ?>

      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">

        <div class="well login-from m-b-75">

          <div class="font-size-19 text-uppercase text-theme font-weight-700 m-b-30"><?php echo $heading_title; ?></div>

          <fieldset id="account">

            <div class="form-group required m-b-25" style="display: <?php echo (count($customer_groups) > 1 ? 'block' : 'none'); ?>;">
              <label class="col-sm-12 text-uppercase"><?php echo $entry_customer_group; ?></label>
              <div class="col-sm-12">
                <?php foreach ($customer_groups as $customer_group) { ?>
                <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
                    <?php echo $customer_group['name']; ?></label>
                </div>
                <?php } else { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" />
                    <?php echo $customer_group['name']; ?></label>
                </div>
                <?php } ?>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required m-b-25">
              <label class="col-sm-12 text-uppercase" for="input-firstname"><?php echo $entry_firstname; ?></label>
              <div class="col-sm-12">
                <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
                <?php if ($error_firstname) { ?>
                <div class="text-danger"><?php echo $error_firstname; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required m-b-25">
              <label class="col-sm-12 text-uppercase" for="input-lastname"><?php echo $entry_lastname; ?></label>
              <div class="col-sm-12">
                <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
                <?php if ($error_lastname) { ?>
                <div class="text-danger"><?php echo $error_lastname; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required m-b-25">
              <label class="col-sm-12 text-uppercase" for="input-email"><?php echo $entry_email; ?></label>
              <div class="col-sm-12">
                <input type="email" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                <?php if ($error_email) { ?>
                <div class="text-danger"><?php echo $error_email; ?></div>
                <?php } ?>
              </div>
            </div>

            <div class="form-group required m-b-25">
              <label class="col-sm-12 text-uppercase" for="input-password"><?php echo $entry_password; ?></label>
              <div class="col-sm-12">
                <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                <?php if ($error_password) { ?>
                <div class="text-danger"><?php echo $error_password; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required m-b-25">
              <label class="col-sm-12 text-uppercase" for="input-confirm"><?php echo $entry_confirm; ?></label>
              <div class="col-sm-12">
                <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
                <?php if ($error_confirm) { ?>
                <div class="text-danger"><?php echo $error_confirm; ?></div>
                <?php } ?>
              </div>
            </div>
          </fieldset>
          <input type="submit" value="Enviar" class="btn btn-primary border-radius-large btn-login" />

        </div>




      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
