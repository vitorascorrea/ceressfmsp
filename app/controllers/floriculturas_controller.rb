class FloriculturasController < ApplicationController
  
  def new
    @floricultura = Floricultura.new
    @bairro = Bairro.all
  end
  
  def create
    @floricultura = Floricultura.new(params.require(:floricultura).permit(:email, :password, :password_confirmation, :nomefloricultura, :endfloricultura, :subprefeitura))
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
  
end
