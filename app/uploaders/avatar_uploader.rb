# encoding: utf-8
class AvatarUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  DEFAULT_IMAGE_ID = 'default_xvbhqx'.freeze

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end

  def default_url
    "/images/fallback/" + [version_name, "default.png"].compact.join('_')
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
      default_image: DEFAULT_IMAGE_ID
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
      default_image: DEFAULT_IMAGE_ID
    )
  end
end
