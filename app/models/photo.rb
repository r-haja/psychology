class Photo < ApplicationRecord
  belongs_to :post

  mount_uploader :post_image, PostImageUploader
end
