  <label class="col-sm-6 control-label" for="input-voucher"><?php echo $entry_voucher; ?></label>
  <div class="input-group col-sm-6">
    <input type="text" name="voucher" value="<?php echo $voucher; ?>" placeholder="<?php echo $entry_voucher; ?>" id="input-voucher" class="form-control" />
    <span class="input-group-btn">
    <button type="button" id="button-voucher" data-loading-text="<?php echo $text_loading; ?>"  class="btn btn-primary" ><i class='fa fa-refresh'></i></button>
    </span> </div>
        <script type="text/javascript"><!--
  $('#button-voucher').on('click', function() {
    $.ajax({
      url: 'index.php?route=extension/total/voucher/voucher',
      type: 'post',
      data: 'voucher=' + encodeURIComponent($('input[name=\'voucher\']').val()),
      dataType: 'json',
      beforeSend: function() {
        $('#button-voucher').button('loading');
      },
      complete: function() {
        $('#button-voucher').button('reset');
      },
      success: function(json) {
        $('.alert').remove();

        if (json['error']) {
          $('.breadcrumb').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

          $('html, body').animate({ scrollTop: 0 }, 'slow');
        }

        if (json['redirect']) {
          location = json['redirect'];
        }
      }
    });
  });
  //--></script>