class AddMidtermplanningToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :midtermplanning, :boolean
  end
end
