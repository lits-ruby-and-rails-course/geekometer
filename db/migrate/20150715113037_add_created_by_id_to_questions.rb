class AddCreatedByIdToQuestions < ActiveRecord::Migration
  def change
  	add_column :questions, :created_by_id, :integer
  end
end
