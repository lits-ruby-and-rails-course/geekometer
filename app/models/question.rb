class Question < ActiveRecord::Base
  validates :condition, presence: true, length: { maximum: 255 }

  has_many :answers, :dependent => :destroy
  belongs_to :topic
  accepts_nested_attributes_for :answers
end
