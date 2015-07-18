class Animal < ActiveRecord::Base
  enum gender: [ :samiec, :samica, :mieszana ]

  belongs_to :species
  belongs_to :user
end
