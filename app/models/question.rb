class Question < ActiveRecord::Base
  validates :condition, presence: true, length: { maximum: 255 }
  validates_presence_of :topic_id

  has_many :answers, :dependent => :destroy
  belongs_to :topic
  accepts_nested_attributes_for :answers,
                                reject_if: lambda {|a| a[:solution].blank?},
                                allow_destroy: true
end