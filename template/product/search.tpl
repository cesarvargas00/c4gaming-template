<?php echo $header; ?>
<div class="main-content">
  <div class="container p-t-35">
    <div class="input-group">
      <input type="text" class="form-control input-lg p-x-20" placeholder="Search for..." value="<?php echo $search; ?>"  id="input-search">
      <span class="input-group-btn">
        <button id="button-search" class="btn btn-primary btn-lg" type="button">Search</button>
      </span>
    </div>

  </div>

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
          
          <?php if ($products) { ?>
          
          <div class="search-category m-b-35">
            <div class="row">
              
              <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                <div class="p-x-20 p-y-15">
                  <span class="span">Category:</span>
                  <select name="" id="input-category" class="select-category select-style">
                    <?php foreach ($categories as $key => $value) { ?>
                    <option value="<?php echo $value['category_id']; ?>"><?php echo $value['name']; ?></option>
                    <?php } ?>
                  </select>
                </div>

              </div>
              <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                <div class="row p-a-20">
                  <div class="col-xs-2 col-sm-2 col-md-3 col-lg-3">
                    <span class="span p-r-5">Price: </span><span class="min-price">0</span>
                  </div>
                  <div class="col-xs-8 col-sm-8 col-md-7 col-lg-7 p-t-7">
                    <div id="slider-range"></div>
                  </div>
                  <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                    <span class="max-price">2000</span>
                  </div>
                </div>
                 
              </div>
              <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                <div class="p-x-20 p-y-15">
                  <label class="span"><?php echo $text_sort; ?></label>
                  <select id="input-sort" class="select-sort select-style">
                    <?php foreach ($sorts as $sorts) { ?>
                    <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                    <option value="<?php echo $sorts['value']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $sorts['value']; ?>"><?php echo $sorts['text']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>

              <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
                  <a href="<?php echo $compare; ?>" id="compare-total" class="btn btn-compare"><?php echo $text_compare; ?></a>
              </div>
            </div>
          </div>

          <div id="results">
            <div class="row">
              <?php foreach ($products as $product) { ?>
              <div class="product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <?php require( DIR_TEMPLATE . 'c4_game/template/product/product_item.tpl'); ?>
              </div>
              <?php } ?>
            </div>
            <div class="row">
              <div class="col-sm-12 text-center"><?php echo $pagination; ?></div>
            </div>
          </div>
          <?php } ?>
          <?php if (!$categories && !$products) { ?>
          <p><?php echo $text_empty; ?></p>
          <div class="buttons">
            <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
          </div>
          <?php } ?>
          <?php echo $content_bottom; ?></div>
      <?php echo $column_right; ?></div>
  </div>
</div>
<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';

	var search = $('#input-search').prop('value');

	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');

	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}

	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

	if (sub_category) {
		url += '&sub_category=true';
	}

	var filter_description = $('#content input[name=\'description\']:checked').prop('value');

	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#input-search').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script>
<script type="text/javascript">

  $(document).ready(function(){
      
      var category = $("#input-category");
      var sort = $("#input-sort");

      sort.on("change", function(){
        getData();
      });

      category.on("change", function(){
        getData();
      });

      $( "#slider-range" ).slider({
        range: true,
        min: 0,
        max: 2000,
        values: [ 30, 1700 ],
        slide: function( event, ui ) {
          $(".min-price").html(ui.values[ 0 ]);
          $(".max-price").html(ui.values[ 1 ]);
        },
        stop: function(event, ui) {
          getData();
        }
      });

      function getData() {
        $("#results").html('<div class="text-center"><i class="fa fa-spinner fa-spin fa-3x fa-fw"></i></div>');
        var sort_order = sort.val().split("-");
        var min_price = $( "#slider-range" ).slider( "values", 0 );
        var max_price = $( "#slider-range" ).slider( "values", 1 );

        var url = "index.php?route=product/category/ajax&path=" + category.val() + "&sort="+sort_order[0]+"&order="+sort_order[1]+"&min_price=" +min_price+ "&max_price=" + max_price +"";min_price;
        $('#results').load(url);
      }

  });
</script>
<?php echo $footer; ?>