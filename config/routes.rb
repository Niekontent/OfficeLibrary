Rails.application.routes.draw do
  root to: 'books#index'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'users/sign_in', to: 'users/sessions#new', as: :new_user_session
    get 'users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  namespace :user do
    resources :books, only: [:index]
    get 'books/:id/borrow', to: 'books#borrow', as: :borrow_book
    get 'books/:id/return', to: 'books#return', as: :return_book
  end

  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
