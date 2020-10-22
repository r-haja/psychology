class Diagnosis < ApplicationRecord
  validates :x_axis, presence: true
  validates :x_axis1, presence: true
  validates :x_axis2, presence: true
  validates :y_axis, presence: true
  validates :y_axis1, presence: true
  validates :y_axis2, presence: true
  validates :result, presence: true
end
