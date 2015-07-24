# == Schema Information
#
# Table name: test_suit_answers
#
#  id           :integer          not null, primary key
#  test_suit_id :integer
#  answer_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class TestSuitAnswer < ActiveRecord::Base
  belongs_to :test_suit
  belongs_to :answer
end
