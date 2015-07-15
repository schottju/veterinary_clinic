class MedicalRecord < ActiveRecord::Base
  belongs_to :user
  belongs_to :veterinarian
  has_many :images
  has_and_belongs_to_many :diseases
end
