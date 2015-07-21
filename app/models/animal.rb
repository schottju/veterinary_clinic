class Animal < ActiveRecord::Base
  enum gender: [ :samiec, :samica, :mieszana ]

  belongs_to :species
  belongs_to :user
  has_and_belongs_to_many :medical_records
end
