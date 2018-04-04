class AddTimerToTests < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :timer, :integer, null: false, default: 15
  end
end
