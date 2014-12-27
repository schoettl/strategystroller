class AddIsStrategicManagementToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :is_strategic_management, :boolean
  end
end
