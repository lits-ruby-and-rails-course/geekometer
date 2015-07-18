class RenameTableTestSuitsQuestionsToQuestionsTestSuits < ActiveRecord::Migration
  def change
    rename_table :test_suits_questions, :questions_test_suits
  end
end
