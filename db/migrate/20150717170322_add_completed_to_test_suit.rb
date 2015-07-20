class AddCompletedToTestSuit < ActiveRecord::Migration
  def change
    add_column :test_suits, :completed, :boolean
  end
end
