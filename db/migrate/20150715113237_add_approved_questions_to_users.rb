class AddApprovedQuestionsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :approved_questions, :integer
  end
end
