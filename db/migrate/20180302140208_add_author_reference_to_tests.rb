class AddAuthorReferenceToTests < ActiveRecord::Migration[5.0]
  def change
    add_reference :tests, :author, foreign_key: {to_table: :users}
  end
end
