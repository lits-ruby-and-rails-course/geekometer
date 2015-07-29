# == Schema Information
#
# Table name: questions
#
#  id            :integer          not null, primary key
#  condition     :text
#  difficulty    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  topic_id      :integer
#  created_by_id :integer
#  approved      :boolean
#

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
