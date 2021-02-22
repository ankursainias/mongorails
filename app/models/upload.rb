class Upload
  include Mongoid::Document

  field :file, type: String

  mount_uploader :file, MixFileUploader

  attr_accessor :image, :mp4_files, :mix_files
end
