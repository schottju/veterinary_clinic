class Veterinarian < ActiveRecord::Base
  belongs_to :user
  has_many :medical_record
  has_many :appointments
end
