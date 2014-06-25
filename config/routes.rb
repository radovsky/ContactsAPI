FirstRoutes::Application.routes.draw do
  resources :users, only: [:create, :destroy, :update, :show, :index] do
    resources :contacts, only: [:create, :destroy, :update, :show, :index]
  end
  resources :contacts, only: [:create, :destroy, :update, :show]
  resources :contact_shares, only: [:create, :destroy, :update, :show, :index]
end
