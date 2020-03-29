class Passport < ApplicationRecord
  belongs_to :user

  validates :purpose, presence: true
  validates :goal, presence: true

  mount_uploader :passport_image, PassportImageUploader
end
