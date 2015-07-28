class Veterinarian < ActiveRecord::Base
  belongs_to :user
  has_many :medical_record
  has_many :appointments
  has_many :vacations
  has_many :working_days

  def custom_label_method
    "#{user.first_name} #{user.last_name}, pwz: #{pwz}"
  end
end
