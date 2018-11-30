class Blog < ApplicationRecord
  validates :slug, uniqueness: true

  mount_base64_uploader :heroImg, ImageUploader
end
