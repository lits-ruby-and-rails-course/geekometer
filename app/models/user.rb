class User < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'

  mount_uploader :avatar, AvatarUploader


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :test_suits
  has_and_belongs_to_many :topics


end
