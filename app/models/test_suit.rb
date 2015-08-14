# == Schema Information
#
# Table name: test_suits
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  completed  :boolean
#

class TestSuit < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :questions
  has_many :test_suit_answers

  after_create do
    self.questions = Question.for_test_suit
  end

  scope :completed, -> { where(completed: true) }

  def complete!
    self.completed = true
  end

  def build_test_suit_answers(answers)
    answers.each do |answer_id|
      test_suit_answers << TestSuitAnswer.new(answer_id: answer_id)
    end
  end

  def stat_test_correct_count
    "#{test_suit_answers.correct.count}"
    end

  def stat_question_correct_count
    "#{questions.correct.count}"
  end
end
