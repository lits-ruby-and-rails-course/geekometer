class Answer < ActiveRecord::Base

  belongs_to :question
  belongs_to :question_quiz
end
