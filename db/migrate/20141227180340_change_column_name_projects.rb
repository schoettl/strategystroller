class ChangeColumnNameProjects < ActiveRecord::Migration
  def change
    rename_column :projects, :description, :management_summary
  end
end
