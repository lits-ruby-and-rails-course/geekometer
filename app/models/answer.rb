# == Schema Information
#
# Table name: answers
#
#  id           :integer          not null, primary key
#  question_id  :integer
#  solution     :text
#  answer_valid :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Answer < ActiveRecord::Base

  belongs_to :question
  has_many :test_suit_answers, dependent: :destroy
end
