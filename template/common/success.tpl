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
    <div id="content" class="<?php echo $class; ?> text-center p-y-90"><?php echo $content_top; ?>
      <img src="catalog/view/theme/c4_game/images/success.png" alt="" />
      <h1 class="m-b-30"><?php echo $heading_title; ?></h1>
      <?php echo $text_message; ?>
      <div class="buttons m-t-70">
        <div><a href="<?php echo $continue; ?>" class="btn btn-primary p-x-35 border-radius-large"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>