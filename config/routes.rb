Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :accounts do
        member do
          post 'show'
          post 'index'
          post 'transter'
        end
      end
      # post "bank_accounts/new_transaction", to: "bank_accounts#new_transaction"
    end
  end
end
