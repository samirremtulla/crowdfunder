class Image < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :project
  mount_uploader :file, ImageUploader
  attr_accessible :file
end
