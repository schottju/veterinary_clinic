class Veterinarian < ActiveRecord::Base
  belongs_to :user
  has_one :medical_record
  has_many :appointments
end
