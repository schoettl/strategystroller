class AddStrategicmanagementToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :strategicmanagement, :boolean
  end
end
