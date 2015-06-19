Rails.application.routes.draw do
  
  get 'cadastro', :to => 'floriculturas#new'
  get 'login', :to => 'sessions#new'
  get 'logout', :to => 'sessions#destroy'
  get 'venda', :to => 'chamados#new'
  post 'aceitar', :to => 'floriculturas#aceitar'
  post 'recusar', :to => 'floriculturas#recusar'
  
  resources :floriculturas
  resources :usuarios
  resources :sessions  
  resources :chamados  
  
  root 'sessions#new'
  
  
end
