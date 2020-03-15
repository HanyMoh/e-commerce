class OrganizationTheme < ApplicationRecord
  mount_uploaders :slider_images, ImageUploader
  mount_uploader :logo, ImageUploader
  mount_uploader :first_section_image, ImageUploader
  mount_uploader :second_section_image, ImageUploader

  belongs_to :organization

  scope :newest_first, -> { order('created_at desc') }
end
