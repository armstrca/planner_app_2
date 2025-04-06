Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  resources :monthly
  resources :weekly
  resources :daily
  resources :planner
  resources :editor
  resources :planner_entry
  resources :tldraw_snapshots
end
