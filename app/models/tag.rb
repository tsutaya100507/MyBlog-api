class Tag < ApplicationRecord
  has_many :blog_tags, dependent: :destroy
  has_many :blogs, through: :blog_tags
  validates :name, length: { maximum: 15 }
end
