class Question < ActiveRecord::Base
  validates :condition, presence: true, length: { maximum: 255 }
  validates_presence_of :topic_id
  def status_enum
    [['Approved', 1],['Pending',0],['Rejected',2]]
  end
  has_many :answers, :dependent => :destroy
  has_and_belongs_to_many :test_suits
  belongs_to :topic
  accepts_nested_attributes_for :answers,
                                reject_if: lambda {|a| a[:solution].blank?},
                                allow_destroy: true

  scope :approved, -> { where(approved: true) }
  scope :for_test_suit, -> { approved.order("RANDOM()").limit(3) }
end