Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :chamados
  
  root 'welcome#index'
end
