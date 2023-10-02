Rails.application.routes.draw do
  get '/ping', to: 'api#ping'
  resources :transactions, only: [:create, :index, :show]
  
  get '/accounts/:id', to: 'account#show'

end

