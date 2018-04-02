class CreateRules < ActiveRecord::Migration[5.1]
  def change
    create_table :rules do |t|
      t.string :description
      t.string :method

      t.timestamps
    end
  end
end
