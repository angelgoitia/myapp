Rails.application.routes.draw do
  devise_for :users, skip: [:sessions]
  as :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create', as: :user_session
    match 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session, via: Devise.mappings[:user].sign_out_via
  end

  resources :teachers

  get 'home/index'
  root to: "home#index"

  
  get '/users/profesor/show', to: 'teachers#index'
  get '/users/profesor/:id/select', to: 'shedules#select'
  get '/users/horario/show', to: 'shedules#index'
  get '/admin/profesor/show', to: 'teachers#index'
  get '/admin/profesor/new', to: 'teachers#new'
  get '/admin/profesor/:id/edit', to: 'teachers#edit'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
