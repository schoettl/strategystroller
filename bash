#15
rails generate migration add_active_to_users active:boolean
#13
rails generate migration add_subproject_to_projects subproject:boolean
#12
rails generate migration add_strategicmanagement_to_projects strategicmanagement:boolean
rails generate migration add_isproject_to_projects isproject:boolean
#14
rails generate migration add_midtermplanning_to_projects midtermplanning:boolean

#11
bin/rails generate model Customer name:string

rake db:reset
rake db:migrate
rake db:seed




