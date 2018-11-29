class Blog < ApplicationRecord
  mount_base64_uploader :heroImg, ImageUploader
end
