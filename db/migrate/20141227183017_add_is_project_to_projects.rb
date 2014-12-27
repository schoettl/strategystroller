class AddIsProjectToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :is_project, :boolean
  end
end
