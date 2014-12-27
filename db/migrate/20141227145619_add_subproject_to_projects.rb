class AddSubprojectToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :subproject, :boolean
  end
end
