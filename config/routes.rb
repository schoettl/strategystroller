StrategyStroller::Application.routes.draw do

  ## FOR MAIN PAGE
  ## Move this here, per: https://github.com/gregbell/active_admin/issues/2049
  root :to => "home#index"
  match "home/index" => "home#index", :as => "home_index"  
  get "home/index"

 
  ## FOR ACTIVE ADMIN
  ActiveAdmin.routes(self)

  ## FOR DEVISE
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  ## FOR FORMTASTIC
  resources :user


  ## FOR MAIN PANELS
  

  ## FOR OTHER LINKS / PATHS
  
  # Controller
  match "controller_unit/input_framework/goals" => "controller_unit#set_goal", :as => "goals"
  match "controller_unit/input_framework/indicators" => "controller_unit#set_indicator", :as => "indicators"
  match "controller_unit/input_framework/projects" => "controller_unit#set_project", :as => "projects"
  match "controller_unit/cu_review" => "controller_unit#cu_review", :as => "cu_review"
  match "controller_unit/graph_panel" => "controller_unit#graph_panel", :as => "graph_panel"
  match "controller_unit/goal_check" => "controller_unit#goal_check", :as => 'goal_check'
  match "controller_unit/indicator_check" => "controller_unit#indicator_check", :as => 'indicator_check'
  match "controller_unit/project_check" => "controller_unit#project_check", :as => 'project_check'
  match "controller_unit/all_data" => "controller_unit#all_data", :as => 'all_data'
  match "controller_unit/all_activity" => "controller_unit#all_activity", :as => 'all_activity'
  match "controller_unit/all_project" => "controller_unit#all_project", :as => 'all_project'
  match "controller_unit/all_indicator" => "controller_unit#all_indicator", :as => 'all_indicator'
  match "controller_unit/all_goal" => "controller_unit#all_goal", :as => 'all_goal'
  match "controller_unit/all_dimension" => "controller_unit#all_dimension", :as => 'all_dimension'
  match "controller_unit/all_form" => "controller_unit#all_form", :as => 'all_form'

  # Provider
  match "provider/goal_define" => "provider#goal_define", :as => 'goal_define'
  match "provider/indicator_define" => "provider#indicator_define", :as => 'indicator_define'
  match "provider/project_define" => "provider#project_define", :as => 'project_define'
  match "provider/activity_define" => "provider#activity_define", :as => 'activities'
  match "provider/indicator_update" => "provider#indicator_update", :as => 'indicator_update'
  match "provider/project_update" => "provider#project_update", :as => 'project_update'
  match "provider/home" => "provider#forms_composite", :as => "forms_composite"
  match "provider/update" => "provider#forms_composite_update", :as => "forms_composite_update"
  match "provider/activity_edit" => "provider#activity_edit", :as => 'activity_edit'

  #applications path currently defaults to setup_system path so really we only need
  #first 'post' route below, but including all 'post' paths to be safe/in case we need them
  post "controller_unit/setup_system" => "controller_unit#applications", :as => "applications"
  post "controller_unit/create_users" => "controller_unit#applications"
  post "controller_unit/remove_users" => "controller_unit#applications"
  get "controller_unit/setup_system" => "controller_unit#setup_system", :as => "setup_system"
  get "controller_unit/create_users" => "controller_unit#create_users", :as => "create_users"
  get "controller_unit/remove_users" => "controller_unit#remove_users", :as => "remove_users"
  get "controller_unit/edit_users" => "controller_unit#edit_users", :as => "edit_users"

  # New routes for the main project form:
  # I tried to name routes and methods as close as possible to the rails conventions
  # while not breaking the design of this app.
  get 'controller_unit/projects/:id/edit' => 'controller_unit#edit_project', :as => 'edit_project'
  put 'controller_unit/projects/:id' => 'controller_unit#update_project', :as => 'project'
  post 'controller_unit/projects/:id/documents' => 'controller_unit#create_document', :as => 'project_documents'
  get 'controller_unit/projects/:id/documents/:filename' => 'controller_unit#show_document', :as => 'project_document'

end
