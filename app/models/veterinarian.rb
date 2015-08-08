class Veterinarian < ActiveRecord::Base
  belongs_to :user
  has_many :medical_records
  has_many :appointments
  has_many :vacations
  has_one :working_day

  accepts_nested_attributes_for :working_day

  validates_presence_of :title, :pwz, :user_id

  def custom_label_method
    "##{id} #{title} #{user.try(:first_name)} #{user.try(:last_name)}, pwz: #{pwz}"
  end
end
