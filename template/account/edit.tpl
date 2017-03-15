<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb hidden">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
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
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
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
      
      <div class="row m-b-80">
        <div class="col-xs-12 col-lg-6 col-md-6">
          <div class="well p-a-35">
            
             <h3 class="text-uppercase m-b-60 text-theme">MEU DADOS</h3>

            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
              <fieldset>
                <div class="form-group">
                  <div class="col-sm-3">
                    <div class="avatar">
                      <?php if ($avatar) { ?>
                        <img class="border-radius-100" id="avatar" src="<?php echo $avatar; ?>" alt="AVATAR" width="80" height="80" />
                      <?php } ?>
                    </div>
                  </div>
                  <div class="col-sm-9">
                    <button type="button" id="button-upload" data-loading-text="loading" class="btn btn-border border-radius-large text-uppercase m-t-20 m-r-30">
                      <i class="fa fa-upload m-r-10"></i>TRocar Foto
                    </button>
                    <input type="hidden" name="avatar" value="<?php echo $avatar_data; ?>" id="input-avatar" />
                     <button id="remove-avatar" class="btn btn-border border-radius-large text-uppercase text-theme m-t-20">Remover Foto</button>
                  </div>
                  
                </div>

                <hr class="m-t-40 m-b-40">
        
                <div class="form-group required">
                  <label class="col-sm-12 text-uppercase" for="input-firstname"><?php echo $entry_firstname; ?> </label>
                  <div class="col-sm-12">
                    <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
                    <?php if ($error_firstname) { ?>
                    <div class="text-danger"><?php echo $error_firstname; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-12 text-uppercase" for="input-lastname"><?php echo $entry_lastname; ?></label>
                  <div class="col-sm-12">
                    <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
                    <?php if ($error_lastname) { ?>
                    <div class="text-danger"><?php echo $error_lastname; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-12 text-uppercase" for="input-email"><?php echo $entry_email; ?></label>
                  <div class="col-sm-12">
                    <input type="email" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                    <?php if ($error_email) { ?>
                    <div class="text-danger"><?php echo $error_email; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-12 text-uppercase" for="input-telephone"><?php echo $entry_telephone; ?></label>
                  <div class="col-sm-12">
                    <input type="tel" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
                    <?php if ($error_telephone) { ?>
                    <div class="text-danger"><?php echo $error_telephone; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-12 text-uppercase" for="input-fax"><?php echo $entry_fax; ?></label>
                  <div class="col-sm-12">
                    <input type="text" name="fax" value="<?php echo $fax; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-fax" class="form-control" />
                  </div>
                </div>
                <a href='<?php echo $password ?>'  class="text-uppercase text-theme m-t-20">Alterar senha</a>
                <?php foreach ($custom_fields as $custom_field) { ?>
                <?php if ($custom_field['location'] == 'account') { ?>
                <?php if ($custom_field['type'] == 'select') { ?>
                <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                  <label class="col-sm-12 text-uppercase" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                  <div class="col-sm-12">
                    <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                      <option value=""><?php echo $text_select; ?></option>
                      <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                      <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                      <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                    <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'radio') { ?>
                <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                  <label class="col-sm-12 text-uppercase"><?php echo $custom_field['name']; ?></label>
                  <div class="col-sm-12">
                    <div>
                      <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                      <div class="radio">
                        <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                        <label>
                          <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                          <?php echo $custom_field_value['name']; ?></label>
                        <?php } else { ?>
                        <label>
                          <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                          <?php echo $custom_field_value['name']; ?></label>
                        <?php } ?>
                      </div>
                      <?php } ?>
                    </div>
                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                    <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'checkbox') { ?>
                <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                  <label class="col-sm-12 text-uppercase"><?php echo $custom_field['name']; ?></label>
                  <div class="col-sm-12">
                    <div>
                      <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                      <div class="checkbox">
                        <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $account_custom_field[$custom_field['custom_field_id']])) { ?>
                        <label>
                          <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                          <?php echo $custom_field_value['name']; ?></label>
                        <?php } else { ?>
                        <label>
                          <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                          <?php echo $custom_field_value['name']; ?></label>
                        <?php } ?>
                      </div>
                      <?php } ?>
                    </div>
                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                    <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'text') { ?>
                <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                  <label class="col-sm-12 text-uppercase" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                  <div class="col-sm-12">
                    <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                    <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'textarea') { ?>
                <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                  <label class="col-sm-12 text-uppercase" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                  <div class="col-sm-12">
                    <textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                    <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'file') { ?>
                <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                  <label class="col-sm-12 text-uppercase"><?php echo $custom_field['name']; ?></label>
                  <div class="col-sm-12">
                    <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                    <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : ''); ?>" />
                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                    <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'date') { ?>
                <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                  <label class="col-sm-12 text-uppercase" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                  <div class="col-sm-12">
                    <div class="input-group date">
                      <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                      </span></div>
                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                    <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'time') { ?>
                <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                  <label class="col-sm-12 text-uppercase" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                  <div class="col-sm-12">
                    <div class="input-group time">
                      <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                      </span></div>
                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                    <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <?php } ?>
                <?php if ($custom_field['type'] == 'datetime') { ?>
                <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
                  <label class="col-sm-12 text-uppercase" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
                  <div class="col-sm-12">
                    <div class="input-group datetime">
                      <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                      <span class="input-group-btn">
                      <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                      </span></div>
                    <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                    <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <?php } ?>
                <?php } ?>
                <?php } ?>
              </fieldset>
              <div class="buttons clearfix m-t-30">
                <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default border-radius-large m-w-200 btn-large"><?php echo $button_back; ?></a></div>
                <div class="pull-right">
                  <input type="submit" value="Salvar" class="btn btn-border border-radius-large m-w-200 btn-large" />
                </div>
              </div>
            </form>

          </div>
        </div>
        <div class="col-xs-12 col-lg-6 col-md-6">
          <div class="well p-a-35">
             <h3 class="text-uppercase m-b-60 text-theme">MEu Endereço</h3>

             <?php echo $form_edit; ?>
          </div>
        </div>
      </div>
    

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
// Sort the custom fields
$('.form-group[data-sort]').detach().each(function() {
	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('.form-group').length) {
		$('.form-group').eq($(this).attr('data-sort')).before(this);
	}

	if ($(this).attr('data-sort') > $('.form-group').length) {
		$('.form-group:last').after(this);
	}

	if ($(this).attr('data-sort') == $('.form-group').length) {
		$('.form-group:last').after(this);
	}

	if ($(this).attr('data-sort') < -$('.form-group').length) {
		$('.form-group:first').before(this);
	}
});
//--></script>
<script type="text/javascript"><!--
$('button[id^=\'button-custom-field\']').on('click', function() {
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
					$(node).parent().find('.text-danger').remove();

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
//--></script>

<!-- enej -->
<script type="text/javascript"><!--
$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;
	
	$('#form-upload').remove();
	
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
	
	$('#form-upload input[name=\'file\']').trigger('click');
	
	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);
			
			$.ajax({
				url: 'index.php?route=tool/avatarupload',
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
						// alert(json['success']);
						
						$('#input-avatar').attr('value', json['file_name']);
            $('#avatar').attr('src', json['url']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});

$("#remove-avatar").on('click', function(e){
  e.preventDefault();
  $('#input-avatar').attr('value', "image/catalog/no-avatar.png");
  $('#avatar').attr('src', "image/catalog/no-avatar.png");
});

//--></script>
<!-- enej -->  
      
<?php echo $footer; ?>
