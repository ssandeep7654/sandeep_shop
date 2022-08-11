Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "carts#index"

  resources :carts
  get 'increase_quantity', to: 'carts#increase_quantity'
  get 'decrease_quantity', to: 'carts#decrease_quantity'
  get 'remove_item', to: 'carts#remove_item'
  resources :items
end
