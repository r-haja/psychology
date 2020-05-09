class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50}
  validates :discription, length: {maximum: 500}

  accepts_nested_attributes_for :photos
end
