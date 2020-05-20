class Psychology < ApplicationRecord
  has_many :passport_psychologys, dependent: :destroy
  has_many :passports, through: :passport_psychologys

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :discription_image, presence: true

  mount_uploader :psychology_image, PsychologyImageUploader
  mount_uploader :discription_image, DiscriptionImageUploader
end
