Rails.application.routes.draw do
  root 'posts#index'

  devise_for :users,
    controllers: { registrations: 'registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i(show)

  resources :posts, only: %i(create index new) do
    resources :photos, only: %i(create)
  end
end
