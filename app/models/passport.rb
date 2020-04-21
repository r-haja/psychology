class Passport < ApplicationRecord
  belongs_to :user

  has_many :passport_psychologys
  has_many :psychologies, through: :passport_psychologys
  accepts_nested_attributes_for :passport_psychologys

  validates :purpose, presence: true
  validates :goal, presence: true

  mount_uploader :passport_image, PassportImageUploader
end
