class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.integer :category_id

      t.timestamps
    end
  end
end
