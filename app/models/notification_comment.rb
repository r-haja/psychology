class NotificationComment < ApplicationRecord
  has_many :notifications


  validates :comment, presence: true
  validates :date_type, presence: true
end
