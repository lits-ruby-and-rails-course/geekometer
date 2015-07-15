class CreateTestSuitsQuestions < ActiveRecord::Migration
  def change
    create_table :test_suits_questions do |t|
      t.references :test_suit, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
    end
  end
end
