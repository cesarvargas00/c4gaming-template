<?php echo $header; ?>
<div class="container">
    <?php echo $slideshow; ?>
</div>
<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>

    <div class="dtn-blogs layout3">
        
        <?php foreach ($blogs as $key => $blog) {?>
        <div class="dtn-blog-item">
            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                    <div class="blog-image">
                        <img class="img-responsive" src="<?php echo $blog['thumb']; ?>" alt="">
                    </div>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                    <div class="blog-description">

                    <div class="title-category m-b-20 text-uppercase">
                        <?php echo $blog['category']; ?>
                    </div>

                      <div class="name m-b-20">
                        <a href="<?php echo $blog['href']; ?>"><?php echo $blog['name']; ?></a>
                      </div>
                      <div class="sort-description"><?php echo $blog['sort_description']; ?></div>

                      <hr>

                      <div class="info clearfix">
                        <a class="read-more pull-left text-theme" href="<?php echo $blog['href']; ?>">+ Read more</a>
                        <div class="date pull-right"><i class="fa fa-clock-o"></i> <?php echo $blog['date']; ?></div>
                        <div class="comments p-r-10 p-l-10 pull-right"><i class="fa fa-commenting"></i> <?php echo $blog['comments']; ?></div>
                      </div>

                    </div>
                </div>
            </div>
        </div>
        <?php } ?>
    </div>   

    <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>