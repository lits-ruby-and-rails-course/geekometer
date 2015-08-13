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

class Question < ActiveRecord::Base
  validates :condition, presence: true, length: { maximum: 255 }
  validates_presence_of :topic_id
  def status_enum
    [['Approved', 1],['Pending',0],['Rejected',2]]
  end
  has_many :answers, :dependent => :destroy
  has_and_belongs_to_many :test_suits
  belongs_to :topic
  belongs_to :user
  accepts_nested_attributes_for :answers,
                                reject_if: lambda {|a| a[:solution].blank?},
                                allow_destroy: true

  scope :approved, -> { where(approved: true) }
  scope :for_test_suit, -> { approved.order("RANDOM()").limit(10) }
  scope :correct, -> { joins(:answers).where(answers: { answer_valid: true}) }

  def approve!
    update_attribute(:approved, true)
  end
end
