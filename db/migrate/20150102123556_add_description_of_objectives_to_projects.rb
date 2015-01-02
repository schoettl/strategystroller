class AddDescriptionOfObjectivesToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :description_of_objectives, :text
  end
end
