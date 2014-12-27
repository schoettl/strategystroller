class AddIsSubprojectToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :is_subproject, :boolean
  end
end
