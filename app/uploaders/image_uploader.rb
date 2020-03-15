class ImageUploader < CarrierWave::Uploader::Base
  storage :file

  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    '/fallback/default.png'
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:

  version :thumb do
    process resize_to_fit: [50, 50]
  end

  version :thumb_fill do
    process resize_to_fill: [50, 50]
  end

  version :small do
    process resize_to_fit: [200, 200]
  end

  version :small_fill do
    process resize_to_fill: [200, 200]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # def filename
  #   "something.jpg" if original_filename
  # end
end
