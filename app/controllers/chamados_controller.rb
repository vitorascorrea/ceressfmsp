class ChamadosController < ApplicationController
 
  def index
    @chamados = Chamado.all
  end
  
  def show
    @chamado = Chamado.find(params[:id])
    @chamados = Chamado.all
  end
  
  def new
    @chamado = Chamado.new
    @bairro = Bairro.all
    @produto = Produto.all
  end
  
  def create
    @produto ||= Produto.all
    @bairro ||= Bairro.all
    @chamado = Chamado.new(params.require(:chamado).permit(:itens, :total, :nomec, :cpf, :telefone1, :telefone2, :nomef, :endvel, :bairro, :datahorariovel, :nomee, :formapag)) 
    
    if @chamado.save
      redirect_to @chamado
    else
      render 'new'
    end
    
  end
  
  
end
