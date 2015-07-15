class Animal < ActiveRecord::Base
  enum gender: [ :female, :male ]

  has_one :species
  belongs_to :user
end
