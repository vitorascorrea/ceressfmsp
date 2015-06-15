class SessionsController < ApplicationController
  def new
  end

  def create
    floricultura = Floricultura.find_by_email(params[:email])
    if floricultura && floricultura.authenticate(params[:password])
      session[:floricultura_id] = floricultura.id
      
      if floricultura.email != "agenciador"
        redirect_to floricultura
      else         
        redirect_to venda_url 
      end      
           
    else
      flash.now.alert = "Email ou senha incorretos."
      render "new"
    end
  end

  def destroy
    session[:floricultura_id] = nil
    redirect_to root_url
  end
end
