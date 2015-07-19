class Species < ActiveRecord::Base
  has_many :animal

  validates_presence_of :name
end
