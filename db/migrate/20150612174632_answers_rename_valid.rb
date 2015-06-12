class AnswersRenameValid < ActiveRecord::Migration
  def change
    rename_column :answers, :valid, :answer_valid
  end
end
