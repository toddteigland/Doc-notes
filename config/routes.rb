Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  resources :appointments do
    resources :appointment_issues, only: [:create]
    resources :notes, only: [:create]
    resources :issues do
      resources :notes, only: [:create] # Assuming you have a Notes controller
    end
  end
  resources :issues
  resources :notes
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: "home#index"

end
