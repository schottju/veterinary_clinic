class File < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :medical_record
end
