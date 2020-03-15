class AddOrganizationIdToPanoramaGalleryAndNewSection < ActiveRecord::Migration[5.1]
  def change
    add_reference :new_sections, :organization
    add_reference :panorama_galleries, :organization
  end
end
