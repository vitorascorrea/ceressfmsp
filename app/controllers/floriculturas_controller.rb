class FloriculturasController < ApplicationController
  
  def new
    @floricultura = Floricultura.new
    @usuario = Usuario.new
    @bairro = Bairro.all
  end
  
  def create 
    @bairro = Bairro.all
    @floricultura = Floricultura.new(params.require(:floricultura).permit(:email, :nomefloricultura, :endfloricultura, :subprefeitura))
    @usuario = Usuario.new(params.require(:usuario).permit(:password, :password_confirmation))
    @usuario.email = @floricultura.email
    @usuario.tipo = "floricultura"    
    
    if @floricultura.save && @usuario.save
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
