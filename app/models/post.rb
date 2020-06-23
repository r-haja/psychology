class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, length: { maximum: 50}
  validates :discription, presence: true, length: {maximum: 500}

  accepts_nested_attributes_for :photos

  def post_user_not_deleted?(post)
    post.user.deleted_at == nil
  end
end
