class MedicalRecord < ActiveRecord::Base
  belongs_to :user
  belongs_to :veterinarian
  has_many :images
end
