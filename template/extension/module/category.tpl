<div class="panel panel-default">
  <div class="panel-heading">
    <h3 class="panel-title"><?php echo $heading_title; ?></h3>
  </div>
  <div class="panel-body">
    <div class="list-group">
      <?php foreach ($categories as $category) { ?>
      <?php if ($category['category_id'] == $category_id) { ?>
      <a href="<?php echo $category['href']; ?>" class="list-group-item active"><?php echo $category['name']; ?></a>
      <?php if ($category['children']) { ?>
      <?php foreach ($category['children'] as $child) { ?>
      <?php if ($child['category_id'] == $child_id) { ?>
      <a href="<?php echo $child['href']; ?>" class="list-group-item active">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
      <?php } else { ?>
      <a href="<?php echo $child['href']; ?>" class="list-group-item">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
      <?php } ?>
      <?php } ?>
      <?php } ?>
      <?php } else { ?>
      <a href="<?php echo $category['href']; ?>" class="list-group-item"><?php echo $category['name']; ?></a>
      <?php } ?>
      <?php } ?>
    </div>

    <div class="input-group">
      <input type="text" class="form-control" placeholder="Buscar...">
      <span class="input-group-btn">
        <button class="btn btn-primary" type="button"><i class="fa fa-search"></i></button>
      </span>
    </div>

  </div>
</div>


