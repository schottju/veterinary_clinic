class Unit < ActiveRecord::Base
  has_many :medicines

  validates_presence_of :name
end
