class Blog < ApplicationRecord
  validates :slug, uniqueness: true
  has_many :blog_tags, dependent: :destroy
  has_many :tags, through: :blog_tags
  mount_base64_uploader :heroImg, ImageUploader

  def save_tags(tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    binding.pry
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    old_tags.each do |old_tag_name|
      self.tags.delete Tag.finc_by(name: old_tag_name)
    end

    new_tags.each do |new_tag_name|
      blog_tag = Tag.find_or_create_by(name: new_tag_name)
      self.tags << blog_tag
    end
  end
end
