class Picture < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_and_belongs_to_many :medical_records

  validates_presence_of :name, :image
end
