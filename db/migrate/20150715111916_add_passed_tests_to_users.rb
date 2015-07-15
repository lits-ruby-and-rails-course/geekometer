class AddPassedTestsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :passed_tests, :string
  end
end
