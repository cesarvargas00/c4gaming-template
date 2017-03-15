  <footer class="footer p-t-65">
    <div class="container p-b-80">
      <div class="row">

        <div class="col-xs-12 col-sm-12 col-md-7 col-lg-7">
          <div class="col-xs-12 col-sm-12 col-md-7 col-lg-7">
            <div class="footer-heading"><?php echo $text_contact; ?></div>
            <div class="information">
               <?php echo html_entity_decode($config_address); ?>
            </div>

            <div class="footer-heading m-b-10"><?php echo $text_social; ?></div>

            <ul class="list-inline">
              <li><a href="#"><i class="fa fa-twitter fa-2x m-r-10"></i></a></li>
              <li><a href="#"><i class="fa fa-facebook-square fa-2x fa-2x m-r-10"></i></a></li>
              <li><a href="#"><i class="fa fa-google-plus fa-2x"></i></a></li>
            </ul>

          </div>
          <div class="col-xs-12 col-sm-12 col-md-5 col-lg-5">
            <?php if ($informations) { ?>
            <div class="footer-heading"><?php echo $text_information; ?></div>
              <ul class="list-unstyled list-infomation">
                <?php foreach ($informations as $information) { ?>
                <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                <?php } ?>
              </ul>
            <?php } ?>
          </div>
        </div>

        <div class="col-xs-12 col-sm-12 col-md-5 col-lg-5">
          <div class="footer-heading m-b-10"><?php echo "Formas de pagamento"; //$text_payment; ?></div>
          <img src="<?php echo "image/" . $payment_icon; ?>" alt="">
          <!--
          <div class="footer-heading m-b-10 m-t-50"><?php //echo $text_security; ?></div>
          <img src="image/catalog/security.png" alt="">
          -->
        </div>
      
      </div>
    </div>

    <div class="container">
      <div class="copyright text-center p-t-40 p-b-40">C4 Gaming © 2017. Todos os direitos reservados</div>
    </div>

  </footer>

</div>

<div class="off-canvas-base off-canvas-left">
  <ul class="menu-left-content list-unstyled list-offcanvas"></ul>
</div>

<div class="off-canvas-base off-canvas-right">
   <ul class="menu-right-account list-unstyled list-offcanvas"></ul>
</div>

<script type="text/javascript">

  $(".off-canvas-left .menu-left-content").html($("#menu > .collapse > .nav").html());
  $(".off-canvas-right .menu-right-account").html($(".account-link").html());

  $(".toggle-offcanvas").on('click', function(e){
      e.preventDefault();
      var classBody = $(this).attr("data-open");
      $('body').toggleClass(classBody);
  });

</script>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

</body></html>