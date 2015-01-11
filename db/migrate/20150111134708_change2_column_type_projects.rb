class Change2ColumnTypeProjects < ActiveRecord::Migration
  def change
    rename_column :projects, :is_strategic_management, :is_strategic
  end
end
