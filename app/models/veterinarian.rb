class Veterinarian < ActiveRecord::Base
  belongs_to :user
  has_many :medical_record
  has_many :appointments
  has_many :vacations
  has_many :working_days
end
