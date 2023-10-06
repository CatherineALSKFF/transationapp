# Rails.application.routes.draw do
#   get 'transactions/create'
#   get 'transactions/show'
#   namespace :api do
#     namespace :v1 do
#   resources :accounts do 
#     put :update
#   end
#   resources :transactions do
#     put :update
#   end  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Defines the root path route ("/")
#   # root "articles#index"
# end
# end
# end


Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :accounts do
        put :update
      end
      resources :transactions do
        put :update
      end
    end
  end
end