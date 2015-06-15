class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
private
  
  def current_user
    @current_user ||= Floricultura.find(session[:floricultura_id]) if session[:floricultura_id]
  end
  helper_method :current_user
  
  def authorize
    redirect_to login_url, alert: "Você precisa estar logado." if current_user.nil?
  end
  
end
