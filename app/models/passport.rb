class Passport < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_one :plan

  has_many :passport_psychologies
  has_many :psychologies, through: :passport_psychologies
  accepts_nested_attributes_for :passport_psychologies

  validates :purpose, presence: true
  validates :goal, presence: true

  mount_uploader :passport_image, PassportImageUploader
end
