class TestSuit < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :questions

  after_create do
    self.questions = Question.for_test_suit
  end

  scope :completed, -> { where(completed: true) }

  def complete!
    self.completed = true
  end
end
