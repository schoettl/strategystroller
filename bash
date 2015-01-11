#15
rails generate migration add_active_to_users active:boolean
#13
rails generate migration add_isSubproject_to_projects is_subproject:boolean
#12
rails generate migration add_isStrategicManagement_to_projects is_strategic_management:boolean
rails generate migration add_isProject_to_projects is_project:boolean
#14
rails generate migration add_midTermPlanning_to_projects mid_term_planning:boolean
#11
bin/rails generate model Customer name:string
#6
rails generate migration ChangeColumnNameProjects
#3
rails generate migration ChangeColumnTypeProjects
#7
rails generate migration add_columns_to_projects decision_requirements_1:text decision_requirements_2:text decision_requirements_3:text decision_requirements_4:text scope:text obstacles_and_risks:text open_issues:text
#16
rails generate migration add_descriptionOfObjectives_to_projects description_of_objectives:text

#23
rails generate migration Change2ColumnTypeProjects

#35
rails generate migration add_foreign_key :project, :customer
is_strategic_management => is_strategic
rake db:reset
rake db:migrate
rake db:seed




