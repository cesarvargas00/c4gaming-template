<div id="comments">
  <div class="comment-list">
    <?php if ($reviews) { ?>
    <?php foreach ($reviews as $review) { ?>
    <div class="comment-item">
        <div class="row">
            <div class="col-75">
                <div class="user-picture">
                    <img class="img-responsive border-radius-100" src="http://placehold.it/50x50" alt="">
                </div>
            </div>
            <div class="col-rest">
                <div class="clearfix m-b-15">
                    <div class="user-name pull-left m-r-20"><?php echo $review['author']; ?></div> 
                    <div class="pull-left date">
                      <?php for ($i = 1; $i <= 5; $i++) { ?>
                        <?php if ($review['rating'] < $i) { ?>
                        <i class="fa fa-star"></i>
                        <?php } else { ?>
                        <i class="fa fa-star text-theme"></i>
                        <?php } ?>
                      <?php } ?>
                    </div>
                </div>
                <p><?php echo $review['text']; ?></p>
                <hr class="m-t-30 m-b-30">
            </div>
        </div>
    </div>    
    <?php } ?>
    <div class="text-center"><?php echo $pagination; ?></div>
    <?php } ?>
  </div>
</div>