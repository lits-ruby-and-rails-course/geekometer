class AddMaximumScoreToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :maximum_score, :integer
  end
end
