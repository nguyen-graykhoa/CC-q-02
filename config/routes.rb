Rails.application.routes.draw do
  get 'sessions/new'
  get 'idea_factories/index'
  get 'idea_factories/new'
  get 'idea_factories/show'
  get 'idea_factories/edit'
  get 'users/new'
  
  get('/',{to: "idea_factories#index", as: :home})
  resources :idea_factotries

  resources :users

  resource :sessions, only: [:new, :destroy, :create]

  root "idea_factories#index"
end
