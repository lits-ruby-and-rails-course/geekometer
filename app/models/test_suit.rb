class TestSuit < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :questions

  scope :completed, -> { where(completed: true) }

  def complete!
    self.completed = true
  end

  def set_questions!
    questions = Question.for_test_suit
    questions.each do |q|
      self.questions << q
    end
  end
end
