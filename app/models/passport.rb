class Passport < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :plans, dependent: :destroy
  has_many :schedules, dependent: :destroy

  has_many :passport_psychologies
  has_many :psychologies, through: :passport_psychologies
  accepts_nested_attributes_for :passport_psychologies

  validates :purpose, presence: true
  validates :goal, presence: true

  mount_uploader :passport_image, PassportImageUploader
  accepts_nested_attributes_for :plans, allow_destroy: true

  def self.start_time(id)
    passport = find_by(id)
    passport.plans.first.start_time
  end
end
