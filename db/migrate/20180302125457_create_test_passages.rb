class CreateTestPassages < ActiveRecord::Migration[5.0]
  def change
    create_table :test_passages do |t|
      t.references :user, foreign_key: true, null: false
      t.references :test, foreign_key: true, null: false
      t.references :current_question, foreign_key: {to_table: :questions}
      t.integer :correct_questions, default: 0

      t.timestamps
    end
  end
end
