class Passport < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :plans, dependent: :destroy
  has_many :schedules, dependent: :destroy

  has_many :passport_psychologies
  has_many :psychologies, through: :passport_psychologies

  delegate :start_time,
           :end_time,
           :to => :plan,
           :prefix => true

  delegate :name,
           :profile_image,
           :to => :user,
           :prefix => true

  accepts_nested_attributes_for :passport_psychologies

  validates :purpose, presence: true
  validates :goal, presence: true

  mount_uploader :passport_image, PassportImageUploader
  accepts_nested_attributes_for :plans, allow_destroy: true

  def start_time(passport)
    plans.first.start_time_to_s(passport)
  end

  def end_time(passport)
    plans.first.end_time_to_s(passport)
  end

end
