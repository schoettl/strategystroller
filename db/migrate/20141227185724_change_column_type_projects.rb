class ChangeColumnTypeProjects < ActiveRecord::Migration
  def change
    change_column(:projects, :yearly_target_cost, :integer)
    change_column(:projects, :yearly_target_manp, :integer)
  end
  
end
