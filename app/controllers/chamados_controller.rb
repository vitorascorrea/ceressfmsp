class ChamadosController < ApplicationController
 before_filter :authorize, only: [:new]
  def index
    @chamados = Chamado.all
  end
  
  def show
    @chamado = Chamado.find(params[:id])
  end
  
  def new
    @chamado = Chamado.new
    @bairro = Bairro.all
    @produto = Produto.all
  end
  
  def create
    #Cria o chamado com os dados entrados no formulario, exceto a floricultura que será escolhida a seguir
    @chamado = Chamado.new(params.require(:chamado).permit(:itens, :total, :nomec, :cpf, :telefone1, :telefone2, :nomef, :endvel, :subprefeitura, :datahorariovel, :nomee, :formapag, :floricultura_escolhida))
    
    #Seleciona a floricultura que será associada ao chamado
    floricultura = @chamado.selecionaFloricultura
    
    #Dá update no objeto chamado
    @chamado.update_attribute(:floricultura_escolhida, floricultura)
    
    if @chamado.save
      redirect_to @chamado
    else
      render 'new'
    end    
  end
end
