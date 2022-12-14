Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :accounts, only: [:show, :index] do
        collection do
          post 'transfer'
        end
      end
    end
  end
end
