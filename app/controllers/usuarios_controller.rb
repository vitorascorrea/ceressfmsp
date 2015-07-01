class UsuariosController < ApplicationController
  def new
    @usuario = Usuario.new
  end
  
  def create
    @usuario = Usuario.new(params.require(:usuario).permit(:email, :password, :password_confirmation, :tipo))
         
    if @usuario.save
      redirect_to root_url
    else
      render 'new'
    end
  end  
end
