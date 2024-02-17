Rails.application.routes.draw do

  root "pages#home"
  resources :monthly
  resources :weekly
  resources :daily
  resources :editor

end
