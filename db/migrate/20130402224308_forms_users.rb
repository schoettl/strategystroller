class FormsUsers < ActiveRecord::Migration
  def change
    create_table :forms_users do |t|
        t.integer :form_id
        t.integer :user_id
        t.timestamps
    end
  end
end
