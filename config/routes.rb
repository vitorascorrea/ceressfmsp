Rails.application.routes.draw do
  
  get 'cadastro', :to => 'floriculturas#new'
  get 'login', :to => 'sessions#new'
  get 'logout', :to => 'sessions#new'
  get 'venda', :to => 'chamados#new'
  
  resources :floriculturas
  resources :sessions  
  resources :chamados
  
  root 'sessions#new'
  
  delete "sessions", :to => "sessions#destroy"
  
end
