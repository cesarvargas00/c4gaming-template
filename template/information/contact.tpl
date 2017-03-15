<?php echo $header; ?>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> m-b-30"><?php echo $content_top; ?>
      
      <div class="row">
        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
          <div class="faq">
            <h3 class="text-uppercase m-b-40">FAQ</h3>
            <?php echo $fqa; ?>
          </div>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
          
          <div class="form-content clearfix">
            <h3 class="text-uppercase heading m-b-30 text-theme"><?php echo $text_contact; ?></h3>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
              <fieldset>
                <div class="form-group required">
                  <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                  <div class="">
                    <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
                    <?php if ($error_name) { ?>
                    <div class="text-danger"><?php echo $error_name; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
                  <div class="">
                    <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
                    <?php if ($error_email) { ?>
                    <div class="text-danger"><?php echo $error_email; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
                  <div class="">
                    <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
                    <?php if ($error_enquiry) { ?>
                    <div class="text-danger"><?php echo $error_enquiry; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <?php echo $captcha; ?>
              </fieldset>
              <div class="buttons m-t-25">
                 <input class="btn btn-border border-radius-large btn-large" type="submit" value="<?php echo $button_submit; ?>" />
              </div>
            </form>
          </div>
        </div>
      </div>

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
