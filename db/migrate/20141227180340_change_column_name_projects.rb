class ChangeColumnNameProjects < ActiveRecord::Migration
  def change
    rename_column :projects, :description, :managementsummary
  end
end
