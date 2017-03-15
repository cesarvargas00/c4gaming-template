<link href="app/moip5/css.css" rel="stylesheet">
<?php 
if($tipo_checkout==1){
$continue = ($modo==0)?'https://desenvolvedor.moip.com.br/sandbox/Instrucao.do?token=':'https://www.moip.com.br/Instrucao.do?token=';
$continue .= $token;
?>
<div class="buttons">
  <div class="pull-right">
    <input type="button" value="Concluir Pagamento" id="button-confirm" class="btn btn-primary" data-loading-text="Aguarde..." />
  </div>
</div>
<script type="text/javascript"><!--
$('#button-confirm').on('click', function() {
	$.ajax({
		type: 'get',
		url: 'index.php?route=extension/payment/moip5/confirm',
		cache: false,
		beforeSend: function() {
			$('#button-confirm').button('loading');
		},
		complete: function() {
			$('#button-confirm').button('reset');
		},
		success: function() {
			location = '<?php echo $continue; ?>';
		}
	});
});
//-->
</script>
<?php }else{ ?>

<div id="tela-full-moip5" role="tabpanel">



<div class="meios">

<?php if($cc){ ?>
<div id="cc">

<div class="row">

<div class="col-md-12">

<p class="attention alert alert-warning">Informe abaixo os dados do cart&atilde;o de cr&eacute;dito correspondente ao titular do endere&ccedil;o de cobran&ccedil;a informado durante o checkout na loja.</p>

<form id="creditCardForm" action="javascript:void(0);" method="post" class="form_pagamento_cartao_mp form-horizontal">

<input type="hidden" name="pedido" value="<?php echo $pedido['order_id'];?>">
<input type="hidden" name="bandeira" value="">

<div class="form-group">
<label class="col-md-3 control-label"></label>
<div class="col-md-9"><p class="form-control-static"><img style="background-color: beige;" src="app/moip5/img/imagecc.png" class="img-responsive"></p></div>
</div>

<div class="form-group">
<label class="col-md-3 control-label">Titular</label>
<div class="col-md-9">
<input type="text" value="<?php echo $pedido['payment_firstname'];?> <?php echo $pedido['payment_lastname'];?>" onkeyup="somenteMaiusculos(this)" onkeydown="somenteMaiusculos(this)" class="form-control" id="titular" name="titular" />
</div>
</div>
<div class="form-group">
<label class="col-md-3 control-label">Aniversario</label>
<div class="col-md-3">
<input type="text" value="" maxlength="10" data-mask="99/99/9999" class="form-control" id="aniversario" name="aniversario" />
</div>
<label class="col-md-2 control-label">Telefone</label>
<div class="col-md-4">
<input type="text" value="<?php echo preg_replace('/\D/', '', $pedido['telephone']);?>" maxlength="15" data-mask="(99)99999999?9" class="form-control" id="telefone" name="telefone" />
</div>
</div>
<div class="form-group">
<label class="col-md-3 control-label">CPF/CNPJ</label>
<div class="col-md-9">
<input type="text" onkeypress="return somenteNumerosJavascript(event)" maxlength="14" value="<?php echo (isset($pedido['custom_field'][$fiscal]))?preg_replace('/\D/', '', $pedido['custom_field'][$fiscal]):'';?>" class="form-control" id="fiscal" name="fiscal" />
<input data-checkout="docType" id="tipo_fiscal" type="hidden" value="CPF"/>
</div>
</div>

<div class="form-group">
<label class="col-md-3 control-label">N&uacute;mero do Cart&atilde;o</label>
<div class="col-md-9">
<input type="text" value="" onkeypress="return somenteNumerosJavascript(event)" maxlength="19" class="form-control numero_cartao" id="numero" name="numero" />
</div>
</div>

<div class="form-group">
<label class="col-md-3 control-label">Validade (MM/AA)</label>
<div class="col-md-3">
<input type="text" value="" maxlength="5" data-mask="99/99" class="form-control" id="validade" name="validade" />
</div>
<label class="col-md-2 control-label">Cod. CVV</label>
<div class="col-md-4">
<input type="text" value="" onkeypress="return somenteNumerosJavascript(event)" maxlength="4" class="form-control" id="codigo" name="codigo" />
</div>
</div>

<div class="form-group">
<label class="col-md-3 control-label">Parcelas</label>
<div class="col-md-9">
<select name="parcelas" style="width:100%" class="form-control" id="parcelas">
<option value="0">Digite o n&uacute;mero do cart&atilde;o!</option>
</select>
</div>
</div>

<div class="form-group">
<div class="col-md-9 col-md-offset-3">
<button class="button btn btn-primary" id="button-confirm">Concluir Pagamento</button>
</div>
</div>
</form>
</div>

</div>

</div>
<?php } ?>

<?php 
if($bo){
?>
<div id="bo">
<div class="row">
<div class="col-md-12">


<form id="boletoForm" onsubmit="bloquerTelaBoleto()" method="post" action="javascript:void(0);" class="form-horizontal">

<input type="hidden" name="pedido" value="<?php echo $pedido['order_id'];?>">

<div class="form-group">
<label class="col-md-3 control-label"></label>
<div class="col-md-3 selectContainer">
<img src="app/moip5/img/boleto-128px.png">
</div>
</div>

<div class="form-group">
<div class="col-md-9 col-md-offset-3">
<button class="button btn btn-primary" onclick="pagarBoleto()" id="button-confirm">Concluir Pagamento</button>
</div>
</div>
</form>

</div>
</div>
</div>
<?php } ?>


<?php 
if($de){
?>
<div id="de">
<div class="row">
<div class="col-md-12">


<form id="boletoForm" onsubmit="bloquerTelaBoleto()" method="post" action="javascript:void(0);" class="form-horizontal">

<input type="hidden" name="pedido" value="<?php echo $pedido['order_id'];?>">
<input type="hidden" name="banco" value="">

<div class="form-group">
<label class="col-md-3 control-label"></label>
<div class="col-md-9 selectContainer">
Selecione o banco desejado:
</div>
</div>

<div class="form-group">
<label class="col-md-3 control-label"></label>
<div class="col-md-9 selectContainer">
<a onclick="AplicarBanco('BancoDoBrasil');"><img class="bancos_moip BancoDoBrasil" src="app/moip5/img/BancoDoBrasil.png"></a>  <a onclick="AplicarBanco('Bradesco');"><img class="bancos_moip Bradesco" src="app/moip5/img/Bradesco.png"></a>  <a onclick="AplicarBanco('Itau');"><img class="bancos_moip Itau" src="app/moip5/img/Itau.png"></a>  <a onclick="AplicarBanco('Banrisul');"><img class="bancos_moip Banrisul" src="app/moip5/img/Banrisul.png"></a>
</div>
</div>

<div class="form-group">
<div class="col-md-9 col-md-offset-3">
<button class="button btn btn-primary" id="botao-debito-ativar" onclick="pagarDebito()" id="button-confirm" disabled>Concluir Pagamento</button>
</div>
</div>
</form>

</div>
</div>
</div>
<?php } ?>

</div>

</div>

<div id="MoipWidget" data-token="<?php echo $token;?>" callback-method-success="SucessoMoip5" callback-method-error="FalhaMoip5"></div>

<script type="text/javascript" src="app/moip5/jquery.validate.js?<?php echo time();?>"></script>
<script type="text/javascript" src="app/moip5/additional-methods.js?<?php echo time();?>"></script>
<script type="text/javascript" src="app/moip5/bootbox.min.js?<?php echo time();?>"></script>
<script type="text/javascript" src="app/moip5/block.js?<?php echo time();?>"></script>
<script type="text/javascript" src="app/moip5/loja5.js?<?php echo time();?>"></script>

<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jasny-bootstrap/3.1.3/js/jasny-bootstrap.min.js"></script>
<?php if($modo==0){?>
<script type='text/javascript' src='https://desenvolvedor.moip.com.br/sandbox/transparente/MoipWidget-v2.js'></script>
<?php }else{ ?>
<script type='text/javascript' src='https://www.moip.com.br/transparente/MoipWidget-v2.js'></script>
<?php } ?>
<script type="text/javascript" src="//assets.moip.com.br/v2/moip.min.js"></script>

<script type="text/javascript">
function AplicarBanco(banco){
$('.bancos_moip').css('opacity',0.2);
$('.'+banco).css('opacity',1);
$('#botao-debito-ativar').attr('disabled',false);
$('input[name="banco"]').val(banco);
}

function SucessoMoip5(data){
var meio = data.TaxaMoIP;
if (typeof meio == 'undefined') {

window.open('' + data.url+ '');
var request = $.ajax({
  url: "app/moip5/get.php?link=<?php echo $token;?>&modo=<?php echo $modo;?>",
  type: "GET",
  dataType: "html"
});

request.done(function( msg ) {
location.href="<?php echo $criar;?>";
});

}else{
location.href="<?php echo $criar;?>";
}

}

function FalhaMoip5(data){
console.log(data);
$.unblockUI();
processar_erro_Moip(data);
}

function CarregarParcelas(meio){
    var settings = {
    cofre: "",
    instituicao: meio,
    callback: "retornoCalculoParcelamento"
    };
    MoipUtil.calcularParcela(settings);
}

function retornoCalculoParcelamento(data){
    console.log(data.parcelas);
    var html_options = "";
    var parcela_minima = 5.00;
    for(i=0; data.parcelas && i<data.parcelas.length; i++){
        var valor_pacela = data.parcelas[i].valor;
        var qtd_parc = data.parcelas[i].quantidade;
        if(valor_pacela >= parcela_minima || qtd_parc==1){
        html_options += "<option value='"+qtd_parc+"'>"+qtd_parc+"x de R$"+valor_pacela+" (R$"+data.parcelas[i].valor_total+")</option>";
        }
    };
    $("#parcelas").html(html_options);
}

function pagarBoleto(){
var settings = {
	"Forma": "BoletoBancario"
}
console.log(settings);
MoipWidget(settings);
}

function pagarDebito(){
var settings = {
	"Forma": "DebitoBancario",
	"Instituicao": $('input[name="banco"]').val()
}
console.log(settings);
MoipWidget(settings);
}

function pagarCartao(){
var settings = {
    "Forma": "CartaoCredito",
    "Instituicao": $('input[name="bandeira"]').val(),
    "Parcelas": $('select[name="parcelas"]').val(),
    "CartaoCredito": {
        "Numero": $('input[name="numero"]').val(),
        "Expiracao": $('input[name="validade"]').val(),
        "CodigoSeguranca": $('input[name="codigo"]').val(),
        "Portador": {
            "Nome": $('input[name="titular"]').val(),
            "DataNascimento": $('input[name="aniversario"]').val(),
            "Telefone": $('input[name="telefone"]').val(),
            "Identidade": $('input[name="fiscal"]').val()
        }
    }
}
console.log(settings);
MoipWidget(settings);
}

function processar_erro_Moip(erros){
    var erro = '';
    if (typeof erros.Mensagem !== 'undefined') {
        erro += erros.Codigo+' - '+erros.Mensagem+'<br>';
    }else{
        jQuery.each(erros, function(i, val) {
            erro += val.Codigo+' - '+val.Mensagem+'<br>';
        });
    }
    bootbox.dialog({
    message: erro,
    title: "Ops, erro no pagamento!",
    });
}

function defineBandeira_cc_Moip(bandeira){
$('.numero_cartao').css({"background": "url(app/moip5/icons/"+bandeira+".gif) #FFF no-repeat", "background-position": "right", "background-position-x": "95%"});
}

//funcoes jquery
$('input[name="numero"]').bind("blur",function(){
var bin = $(this).val().replace(/ /g, '').replace(/-/g, '').replace(/\./g, '');
if (bin.length >= 10) {
var objCc = Moip.Validator.cardType(bin);
if(objCc!=null){
if (typeof objCc.brand != 'undefined') {
if(objCc.brand=='VISA'){
var meio = 'Visa';
}else if(objCc.brand=='AMEX'){
var meio = 'AmericanExpress';
}else if(objCc.brand=='MASTER' || objCc.brand=='MASTERCARD'){
var meio = 'Mastercard';
}else if(objCc.brand=='ELO'){
var meio = 'ELO';
}else if(objCc.brand=='DINERS'){
var meio = 'Diners';
}else if(objCc.brand=='HIPER'){
var meio = 'Hiper';
}else if(objCc.brand=='HIPERCARD'){
var meio = 'Hipercard';
}
$('input[name="bandeira"]').val(meio);
CarregarParcelas('Visa');
var bandeira_min = objCc.brand.toLowerCase();
defineBandeira_cc_Moip(bandeira_min);
}
}
}
});

function bloquerTelaBoleto(){
$.blockUI({
	message: '<img width="70" style="margin:10px" src="app/moip5/img/busy.gif">', 
	css: { border: '0px solid #000', 'background-color':'transparent', 'border-radius': '10px' } 
});
return true; 
}

//valida o form cartao
var currentTime = new Date();

$(".form_pagamento_cartao_mp").validate({
showErrors: function(errorMap, errorList) {
if(jQuery.isEmptyObject(errorList)==false && errorList.length > 0){
console.log(errorList);
var alerta = '';
$.each(errorList, function( index, value ){
	alerta += value.message+'<br>';
});
bootbox.dialog({
	message: alerta,
	title: "Dados obrigatorios!",
});
}
},
onclick: false,
onfocusout: false,
onkeyup: false,
submitHandler: function(form) {
$.blockUI({
	message: '<img width="70" style="margin:10px" src="app/moip5/img/busy.gif">', 
	css: { border: '0px solid #000', 'background-color':'transparent', 'border-radius': '10px' } 
});
pagarCartao();
return false;
},
errorClass: "ops_campo_erro",
rules: {
titular: {
required: true,
minlength: 5
},
aniversario: {
required: true,
minlength: 10
},
telefone: {
required: true,
minlength: 10
},
fiscal: {
required: true,
validacpfcnpj:true
},
numero: {
required: true,
validacartao:true
},
validade: {
required: true,
minlength: 5
},
codigo: {
required: true,
minlength: 3,
maxlength: 4
},
parcelas: {
required: true,
min: 1
}
},
messages: {
titular: "Informe nome do titular",
aniversario: "Informe o aniversario do titular",
telefone: "Informe telefone do titular",
fiscal: "Informe o CPF/CNPJ do titular",
numero: "Informe o n\u00famero do cart\u00e3o valido",
validade: "Informe a validade do cart\u00e3o (MM/AA)",
codigo: "Informe o CVV do cart\u00e3o",
parcelas: "Selecione a parcela desejada",
}
});
</script>
<?php } ?>