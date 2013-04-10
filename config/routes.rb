Bdd::Application.routes.draw do
  resources :posts


  root to: 'posts#index'
  resource :posts, only: [:index, :show, :new, :create]
end
