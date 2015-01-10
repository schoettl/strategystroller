class ChangeColumnTypeProjects < ActiveRecord::Migration
  def change
    change_column(:projects, :yearly_target_cost, :text)
    change_column(:projects, :yearly_target_manp, :text)
  end
  
end
