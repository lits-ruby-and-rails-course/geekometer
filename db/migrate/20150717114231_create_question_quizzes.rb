class CreateQuestionQuizzes < ActiveRecord::Migration
  def change
    create_table :question_quizzes do |t|
      t.text :condition

      t.timestamps null: false
    end
  end
end
