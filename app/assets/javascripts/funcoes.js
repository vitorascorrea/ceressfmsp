//Função que verifica se foi selecionado algum produto com quantidade > 0
function verificaSeDigitou(){
	var itens = document.getElementsByClassName("moldura_produtos");
	var aux = 0;
	var link = document.getElementById('confirma_escolha');
	var aux2 = true;
	for(var i = 1; i <= itens.length; i++){
		if(parseInt(document.getElementById('qtd_'+i).value) <= 0){
			aux++;
		}
		if(isNaN(parseInt(document.getElementById('qtd_'+i).value))){
			aux2 = false;
		}
	}
	if(aux == itens.length || aux2 == false){
		document.getElementById('qtd_total').innerHTML = 'Escolha ao menos um produto para continuar';
		link.setAttribute('href', '#');
	}else{	    
		calculaTotal();		
 		link.setAttribute('href', '#cadastro_dados');
	}
}
//Função que atualiza o valor total das compras e exibe/esconde os produtos conforme o número à eles associados
function calculaTotal() {
			var total = 0;
			var str = "";
			var itens = document.getElementsByClassName("moldura_produtos");
			for(var i = 1; i <= itens.length; i++){
				if(isNaN(parseInt(document.getElementById('qtd_'+i).value))){
					document.getElementById('qtd_total').innerHTML = 'Não é um numero';
					document.getElementById('confere_qtd_total').innerHTML = 'Não é um numero';					
					return;
				}
				if(document.getElementById('qtd_'+i).value >= 0){
					total = total + parseFloat(document.getElementById('preco_'+i).value) * parseInt(document.getElementById('qtd_'+i).value);
					str = str + parseInt(document.getElementById('qtd_'+i).value) + " x " + document.getElementById('nome_'+i).value + "; ";
					document.getElementById('confere_'+i).innerHTML = document.getElementById('qtd_'+i).value + " unidade(s)";
				}else{
					document.getElementById('confere_'+i).innerHTML = "nenhuma selecionada";
				}
				if(i == itens.length){
					document.getElementById('qtd_total').innerHTML = 'R$' + total;
					document.getElementById('confere_qtd_total').innerHTML = 'R$' + total;
					document.getElementById('chamado_total').value = parseFloat(total);
					document.getElementById('chamado_itens').value = str;
				}
			}				
}

//Função que atualiza o formulario de conferencia com os valores inseridos no formulario
function confirmaForm() {			
			document.getElementById('c_nomec').innerHTML = document.getElementById('chamado_nomec').value;
			document.getElementById('c_cpf').innerHTML = document.getElementById('chamado_cpf').value;
			document.getElementById('c_telefone1').innerHTML = document.getElementById('chamado_telefone1').value;
			document.getElementById('c_telefone2').innerHTML = document.getElementById('chamado_telefone2').value;
			document.getElementById('c_nomef').innerHTML = document.getElementById('chamado_nomef').value;
			document.getElementById('c_endvel').innerHTML = document.getElementById('chamado_endvel').value;
			document.getElementById('c_bairro').innerHTML = document.getElementById('chamado_subprefeitura').value;
			document.getElementById('c_datahorariovel').innerHTML = document.getElementById('chamado_datahorariovel_3i').value + "/" + document.getElementById('chamado_datahorariovel_2i').value + "/" + document.getElementById('chamado_datahorariovel_1i').value + " às " + document.getElementById('chamado_datahorariovel_4i').value + "h" + document.getElementById('chamado_datahorariovel_5i').value;
			document.getElementById('c_nomee').innerHTML = document.getElementById('chamado_nomee').value;
			document.getElementById('c_formapag').innerHTML = document.getElementById('chamado_formapag').value;
			calculaTotal();
}

//Função de smooth scroll		
$(document).ready(function(){
		$('a[href^="#"]').on('click',function (e) {
		    e.preventDefault();
		    var target = this.hash,
		    $target = $(target);
		    $('html, body').stop().animate({
		        'scrollTop': $target.offset().top
		    }, 900, 'swing');
		});
});

