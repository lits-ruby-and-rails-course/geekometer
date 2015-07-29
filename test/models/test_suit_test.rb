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

require 'test_helper'

class TestSuitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
