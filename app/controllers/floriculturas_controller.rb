class FloriculturasController < ApplicationController
  
  def new
    @floricultura = Floricultura.new
    @bairro = Bairro.all
  end
  
  def create
    @floricultura = Floricultura.new(params.require(:floricultura).permit(:email, :nomefloricultura, :endfloricultura, :subprefeitura))
    
    if @floricultura.save
      redirect_to @floricultura
    else
      render 'new'
    end
  end  
  
  def show
    @floricultura = Floricultura.find(params[:id])
    @abertos = Chamado.where(:floricultura_escolhida => @floricultura.id, :status => "Aberto")
  end
  
  def aceitar
    @chamado = Chamado.find(params[:chamado])
    @chamado.update_attribute(:status, "Fechado")
    @floricultura = Floricultura.find(params[:id])
    redirect_to @floricultura
  end
  
  def recusar
    @chamado = Chamado.find(params[:chamado])
    prox_floricultura = @chamado.selecionaFloricultura
    @chamado.update_attribute(:floricultura_escolhida, prox_floricultura)
    
    @floricultura = Floricultura.find(params[:id])
    redirect_to @floricultura
  end
  
  
end
