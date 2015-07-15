class CreateTestSuitAnswers < ActiveRecord::Migration
  def change
    create_table :test_suit_answers do |t|
      t.references :test_suit, index: true, foreign_key: true
      t.references :answer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
