class Genre < ApplicationRecord
  has_many :passports

  validates :name, uniqueness: true
end
