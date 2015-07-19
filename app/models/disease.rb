class Disease < ActiveRecord::Base
  has_and_belongs_to_many :medical_records

  validates_presence_of :name
end
