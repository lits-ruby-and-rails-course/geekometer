class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question, index: true, foreign_key: true
      t.references :question_quiz, index: true, foreign_key: true
      t.text :solution
      t.boolean :valid

      t.timestamps null: false
    end
  end
end
