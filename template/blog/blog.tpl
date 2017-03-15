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
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
    <div class="dtn-blog">
        <div class="image">
            <img class="img-responsive" src="<?php echo $image_extra_large; ?>" alt="<?php echo $heading_title; ?>">
        </div>
        
        <div class="dtn-blog-content">
            <h1 class="name m-t-0 m-b-70"><?php echo $heading_title; ?></h1>
            <div class="info clearfix m-b-60">
                <div class="comments p-r-10 p-l-10 pull-left"><i class="fa fa-commenting m-r-5"></i> <?php echo $comment_count; ?></div>
                <div class="date pull-left p-r-10 p-l-10"><i class="fa fa-clock-o m-r-5"></i> <?php echo $date; ?></div>
            </div>
            <div class="description m-b-50">
                <?php echo $description; ?>
            </div> 
            <div class="social m-b-100">
                <button class="btn btn-twitter btn-sm border-radius-large m-r-20"><i class="fa fa-twitter pull-left"></i><span class="pull-right">20</span></button>
                <button class="btn btn-facebook btn-sm border-radius-large"><i class="fa fa-facebook pull-left"></i> <span class="pull-right">20</span></button>
            </div>   

            <div class="contemts">
                <div class="comment-form clearfix">
                    <div class="row">
                        <div class="col-75">
                            <div class="user-picture">
                                <img class="img-responsive border-radius-100" src="http://placehold.it/50x50" alt="">
                            </div>
                        </div>
                        <div class="col-rest">
                            <form id="form-comment">
                                <textarea name="text" id="input-message" class="form-control form-message m-b-30" rows="5" required="required" placeholder="Comentário..."></textarea>
                            </form>
                            
                            <div id="results"></div>

                        </div>
                        <div class="col-xs-12 text-right"><button id="submit-comment" class="btn btn-primary border-radius-large p-l-25 p-r-25">Comentar</button></div>
                    </div>
                </div>
                <div id="comments"></div>
            </div>
        </div>
    </div>
    <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

<script>
    
    $(document).ready(function() {
        $('#comments').delegate('.pagination a', 'click', function(e) {
            e.preventDefault();

            $('#comments').fadeOut('slow');

            $('#comments').load(this.href);

            $('#comments').fadeIn('slow');
        });
        
        $('#comments').load('index.php?route=blog/blog/comments&blog_id=<?php echo $blog_id; ?>');

        $('#submit-comment').on('click', function() {
            $.ajax({
                url: 'index.php?route=blog/blog/write&blog_id=<?php echo $blog_id; ?>',
                type: 'post',
                dataType: 'json',
                data: $("#form-comment").serialize(),
                beforeSend: function() {
                    $('#submit-comment').button('loading');
                },
                complete: function() {
                    $('#submit-comment').button('reset');
                },
                success: function(json) {
                    $('.alert-success, .alert-danger').remove();

                    if (json['error']) {
                        $('#results').append('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                    }

                    if (json['request_login']) {
                        $('#results').append('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['request_login'] + '</div>');
                    }

                    if (json['success']) {
                        $('#results').append('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                        $('textarea[name=\'text\']').val('');
                    }
                     
                    $('#comments').load('index.php?route=blog/blog/comments&blog_id=<?php echo $blog_id; ?>');
                }
            });
        });
    });

</script>

<?php echo $footer; ?>