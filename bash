#15
rails generate migration add_active_to_users active:boolean
#13
rails generate migration add_subproject_to_projects subproject:boolean
#12
rails generate migration add_strategicmanagement_to_projects strategicmanagement:boolean
rails generate migration add_isproject_to_projects isproject:boolean


rake db:reset
rake db:migrate
rake db:seed




rake db:schema:dump
