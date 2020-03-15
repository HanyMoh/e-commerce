class VideoUploader < CarrierWave::Uploader::Base
  include CarrierWave::Video # for your video processing
  include CarrierWave::Video::Thumbnailer
  # process encode_video: [:mp4]

  version :thumb do
    process thumbnail: [{ format: 'png', quality: 10, size: 192, strip: true, logger: Rails.logger }]
    def full_filename(for_file)
      png_name for_file, version_name
    end
  end

  def png_name(for_file, version_name)
    %(#{version_name}_#{for_file.chomp(File.extname(for_file))}.png)
  end
end
