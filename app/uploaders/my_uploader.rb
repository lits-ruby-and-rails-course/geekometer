class MyUploader < CarrierWave::Uploader::Base
  def default_url(*args)
    "/public/images/" + [version_name, "default.png"].compact.join('_')
  end
end