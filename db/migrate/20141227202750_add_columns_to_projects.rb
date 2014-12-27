class AddColumnsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :decision_requirements_1, :text
    add_column :projects, :decision_requirements_2, :text
    add_column :projects, :decision_requirements_3, :text
    add_column :projects, :decision_requirements_4, :text
    add_column :projects, :scope, :text
    add_column :projects, :obstacles_and_risks, :text
    add_column :projects, :open_issues, :text
  end
end
