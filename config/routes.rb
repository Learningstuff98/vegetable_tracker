Rails.application.routes.draw do
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  get 'years/:id/notes', to: 'years#notes', as: 'year_notes'
  resources :years do
    resources :crop_types, only: [:new, :create]
  end
  resources :crop_types, only: [:show, :edit, :update, :destroy]
end
