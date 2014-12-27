class AddMidTermPlanningToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :mid_term_planning, :boolean
  end
end
