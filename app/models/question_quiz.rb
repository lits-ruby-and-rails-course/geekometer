class QuestionQuiz < ActiveRecord::Base
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers,
                                reject_if: lambda {|a| a[:solution].blank?},
                                allow_destroy: true
end
