# Rails.application.routes.draw do
#   get '/ping', to: 'ping#ping'

#   resources :accounts, only: [:show, :create] do
#     resources :transactions, only: [:index]
#   end

#   resources :transactions, only: [:create, :show]
# end


Rails.application.routes.draw do
  
  resources :transactions, only: [:index, :create, :show] # Add :show route
  resources :accounts, only: [:show]  

  # get 'accounts/show'
  get '/ping', to: 'ping#show', format: :json, as: :ping
end
