Rails.application.routes.draw do
  
  get 'cadastro', :to => 'floriculturas#new'
  get 'login', :to => 'sessions#new'
  get 'logout', :to => 'sessions#destroy'
  get 'venda', :to => 'chamados#new'
  
  resources :floriculturas
  resources :sessions  
  resources :chamados
  
  root 'sessions#new'
  
  
end
