class ImageUploader < AvatarUploader

  #文件永久存储，项目内部路径
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  #临时文件存储，项目外部路径
  def cache_dir
    "/tmp/ebook_pavilion/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  #文件格式白名单
  def extension_whitelist
    %w(jpg jpeg gif png swf)
  end

end