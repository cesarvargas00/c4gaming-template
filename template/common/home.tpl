<?php echo $header; ?>

<div class="">
    <?php echo $slideshow; ?>
</div>

<div class="main-content p-t-30">

    <div class="container">
      <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?><?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>

        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
                <?php echo $user_left; ?>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
               <?php echo $user_right; ?>
            </div>
        </div>

    </div>

</div>
<?php echo $footer; ?>