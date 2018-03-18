class AddNameAndTypeAttributesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :type, :string, null: false, default: 'User'
    change_column_null :users, :name, true
    rename_column :users, :name, :first_name
    add_column :users, :last_name, :string
    add_index :users, :type
  end
end
