Rails.application.routes.draw do
  resources :instruments do
    resources :notes
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :notes
end
