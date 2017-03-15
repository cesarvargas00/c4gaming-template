<?php 
echo $header; 
$order = @$moip;
function MeioDePagamentoMoip($meio){
if($meio=='CartaoDeCredito'){
return 'Cart&atilde;o de cr&eacute;dito';
}elseif($meio=='DebitoBancario'){
return 'Transfer&ecirc;ncia online';
}else{
return 'Boleto banc&aacute;rio';
}
}
//print_r($order);
?>

<div class="container">
<div class="row">
<?php $class = 'col-sm-12'; ?>
<div id="content" class="<?php echo $class; ?>">

  <h3>Resultado da Transa&ccedil;&atilde;o</h3>
  <p>
  A transa&ccedil;&atilde;o <b><?php echo $order->Pagamento->CodigoMoIP;?></b> relacionada ao seu pedido <b>#<?php echo $pedido['order_id'];?></b> encontra-se no status <b><?php echo $status['nome'];?></b>. 
  <br><br>
   <b>Forma de Pagamento:</b> <?php echo MeioDePagamentoMoip($order->Pagamento->FormaPagamento);?><br>
  <b>Total a pagar:</b> R$<?php echo number_format((float)$order->Pagamento->TotalPago, 2, '.', '');?><?php echo ($order->Pagamento->FormaPagamento!='CartaoDeCredito')?' &agrave; vista':' em '.@$order->Pagamento->Parcela->TotalParcelas.'x no '.@$order->Pagamento->Bandeira.' ('.@$order->Pagamento->Cartao.')';?> <b></b><br>
  <?php if($order->Pagamento->FormaPagamento=='BoletoBancario'){?>
  <br>
  Para que seu pedido seja confirmado acesse o boleto e pague o mesmo at&eacute; o vencimento.<br>
  <a href="<?php echo $url_pagamento;?><?php echo $_GET['token'];?>" class="btn btn-primary" target="_blank">IMPRIMIR BOLETO DE PAGAMENTO</a>
  <br>
  <?php } ?>
  <?php if($order->Pagamento->FormaPagamento=='DebitoBancario'){?>
  <br>
  Para que seu pedido seja confirmado acesse o seu banco e conclua o pagamento.<br>
  <a href="<?php echo $url_pagamento;?><?php echo $_GET['token'];?>" class="btn btn-primary" target="_blank">CONCLUIR PAGAMENTO ONLINE</a>
  <br>
  <?php } ?>
  <br>
  Clique <a href="index.php?route=account/order/info&order_id=<?php echo $pedido['order_id'];?>">aqui</a> para visualizar detalhes de seu pedido ou para mais informa&ccedil;&otilde;es entre em <a href="index.php?route=information/contact">contato</a> com a loja.
  </p>


<script>
(function(){
    var i = document.createElement('iframe');
    i.style.display = 'none';
    i.onload = function() { i.parentNode.removeChild(i); };
    i.src = '<?php echo $iframe;?>';
    document.body.appendChild(i);
})();
</script>

<?php include("app/moip5/html.php");?>

</div>
</div>
</div>

<?php 
echo $footer; 
?>