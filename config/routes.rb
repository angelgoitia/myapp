Rails.application.routes.draw do
  #ruta principal
  get 'home/index'
  root to: "home#index"

  #cambiar ruta de deviser
  devise_for :users, skip: [:sessions]
  as :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create', as: :user_session
    match 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session, via: Devise.mappings[:user].sign_out_via
  end

  #recursos
  #resources :teachers 
  
  #ruta de acceso
  get 'users/profesor/show', to: 'teachers#index'
  get 'users/profesor/:id/select', to: 'shedules#select'
  get 'users/horario/show', to: 'shedules#index'
  get 'admin/profesor/show', to: 'teachers#index'
  get 'admin/profesor/new', to: 'teachers#new'
  post 'admin/profesor/new', to: 'teachers#create'
  get 'admin/profesor/:id/edit', to: 'teachers#edit'
  get 'admin/profesor/:id', to: 'teachers#delete'
  

  get '*path' => redirect('/')
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
