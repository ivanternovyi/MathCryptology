Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  resources :frequency_analysis, only: :index do
    collection do
      post :compute
    end
  end
end
