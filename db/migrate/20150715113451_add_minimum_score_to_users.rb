class AddMinimumScoreToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :minimum_score, :integer
  end
end
