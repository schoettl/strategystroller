#15
rails generate migration add_active_to_users active:boolean
#13
rails generate migration add_isSubproject_to_projects is_subproject:boolean
#12
rails generate migration add_isStrategicManagement_to_projects is_strategic_management:boolean
rails generate migration add_isProject_to_projects isProject:boolean
#14
rails generate migration add_midTermPlanning_to_projects mid_term_planning:boolean
#11
bin/rails generate model Customer name:string
#6
rails generate migration ChangeColumnNameProjects


rake db:reset
rake db:migrate
rake db:seed




