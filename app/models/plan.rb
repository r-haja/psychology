class Plan < ApplicationRecord
  belongs_to :passport

  validates :start_time, presence: true
  validates :end_time, presence: true
end
