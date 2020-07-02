class Genre < ApplicationRecord
  has_many :passports, dependent: :destroy

  validates :name, uniqueness: true
end
