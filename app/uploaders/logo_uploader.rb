# encoding: utf-8
class LogoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end

  def default_url
  end

  process resize_to_fit: [400, 400]
  cloudinary_transformation(fetch_format: :auto)

  # Create different versions of your uploaded files:
  version :medium do
    cloudinary_transformation(
      crop: :fill,
      width: 100,
      height: 100,
      gravity: :faces,
      fetch_format: :auto,
    )
  end

   version :small do
    cloudinary_transformation(
      crop: :thumb,
      width: 50,
      height: 50,
      gravity: :face,
      radius: :max,
      fetch_format: :auto,
    )
  end
end
