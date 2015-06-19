class SessionsController < ApplicationController
  def new
  end

  def create
    usuario = Usuario.find_by_email(params[:email])
    floricultura = Floricultura.find_by_email(params[:email])
    if usuario && usuario.authenticate(params[:password])
      session[:usuario_id] = usuario.id
      
      if usuario.tipo == "agenciador"
        redirect_to venda_url
      else         
        redirect_to floricultura 
      end      
           
    else
      flash.now.alert = "Email ou senha incorretos."
      render "new"
    end
  end

  def destroy
    session[:usuario_id] = nil
    redirect_to root_url
  end
end
