class CreateTestsPassages < ActiveRecord::Migration[5.0]
  def change
    create_table :tests_passages do |t|
      t.references :user, foreign_key: true, index:false, null: false
      t.references :test, foreign_key: true, index:false, null: false

      t.timestamps
    end
  end
end
