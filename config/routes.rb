# frozen_string_literal: true

# == Route Map
#

Rails.application.routes.draw do
  # Routes for the Planner entry resource:

  # CREATE
  post('/insert_planner_entry', { controller: 'planner_entries', action: 'create' })

  # READ
  get('/planner_entries', { controller: 'planner_entries', action: 'index' })

  get('/planner_entries/:path_id', { controller: 'planner_entries', action: 'show' })

  # UPDATE

  post('/modify_planner_entry/:path_id', { controller: 'planner_entries', action: 'update' })

  # DELETE
  get('/delete_planner_entry/:path_id', { controller: 'planner_entries', action: 'destroy' })

  #------------------------------

  # Routes for the Tldraw input resource:

  # CREATE
  post('/insert_tldraw_input', { controller: 'tldraw_inputs', action: 'create' })

  # READ
  get('/tldraw_inputs', { controller: 'tldraw_inputs', action: 'index' })

  get('/tldraw_inputs/:path_id', { controller: 'tldraw_inputs', action: 'show' })

  # UPDATE

  post('/modify_tldraw_input/:path_id', { controller: 'tldraw_inputs', action: 'update' })

  # DELETE
  get('/delete_tldraw_input/:path_id', { controller: 'tldraw_inputs', action: 'destroy' })

  resources :editor
  #------------------------------

  # Routes for the Extra resource:

  # CREATE
  post('/insert_extra', { controller: 'extras', action: 'create' })

  # READ
  get('/extras', { controller: 'extras', action: 'index' })

  get('/extras/:path_id', { controller: 'extras', action: 'show' })

  # UPDATE

  post('/modify_extra/:path_id', { controller: 'extras', action: 'update' })

  # DELETE
  get('/delete_extra/:path_id', { controller: 'extras', action: 'destroy' })

  #------------------------------

  # Routes for the Daily resource:

  # CREATE
  post('/insert_daily', { controller: 'dailies', action: 'create' })

  # READ
  get('/dailies', { controller: 'dailies', action: 'index' })

  get('/dailies/:path_id', { controller: 'dailies', action: 'show' })

  # UPDATE

  post('/modify_daily/:path_id', { controller: 'dailies', action: 'update' })

  # DELETE
  get('/delete_daily/:path_id', { controller: 'dailies', action: 'destroy' })

  #------------------------------

  # Routes for the Monthly resource:

  # CREATE
  post('/insert_monthly', { controller: 'monthlies', action: 'create' })

  # READ
  get('/monthlies', { controller: 'monthlies', action: 'index' })

  get('/monthlies/:path_id', { controller: 'monthlies', action: 'show' })

  # UPDATE

  post('/modify_monthly/:path_id', { controller: 'monthlies', action: 'update' })

  # DELETE
  get('/delete_monthly/:path_id', { controller: 'monthlies', action: 'destroy' })

  #------------------------------

  # Routes for the Weekly resource:

  # CREATE
  post('/insert_weekly', { controller: 'weeklies', action: 'create' })

  # READ
  get('/weeklies', { controller: 'weeklies', action: 'index' })

  get('/weeklies/:path_id', { controller: 'weeklies', action: 'show' })

  # UPDATE

  post('/modify_weekly/:path_id', { controller: 'weeklies', action: 'update' })

  # DELETE
  get('/delete_weekly/:path_id', { controller: 'weeklies', action: 'destroy' })

  #------------------------------

  # Routes for the Planner resource:

  # CREATE
  post('/insert_planner', { controller: 'planners', action: 'create' })

  # READ
  get('/planners', { controller: 'planners', action: 'index' })

  get('/planners/:path_id', { controller: 'planners', action: 'show' })

  # UPDATE

  post('/modify_planner/:path_id', { controller: 'planners', action: 'update' })

  # DELETE
  get('/delete_planner/:path_id', { controller: 'planners', action: 'destroy' })

  #------------------------------

  devise_for :users

  root 'pages#home'
  resources :monthly
  resources :weekly
  resources :daily
  resources :editor
end
