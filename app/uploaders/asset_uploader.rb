class AssetUploader < CarrierWave::Uploader::Base
  storage :file

  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}/Android"
  end

  def filename
    model.asset_name if original_filename
  end
end
