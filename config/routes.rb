Rails.application.routes.draw do
  root 'pages#test'
  get 'article/:id', to: 'pages#show', as: 'show'
end
