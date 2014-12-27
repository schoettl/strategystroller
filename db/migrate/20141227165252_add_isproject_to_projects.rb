class AddIsprojectToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :isproject, :boolean
  end
end
