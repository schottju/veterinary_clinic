class Animal < ActiveRecord::Base
  has_one :species
  belongs_to :user
end
