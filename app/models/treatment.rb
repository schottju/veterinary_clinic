class Treatment < ActiveRecord::Base
  has_and_belongs_to_many :medical_records
end
