class Animal < ActiveRecord::Base
  enum gender: [ :female, :male ]

  belongs_to :species
  belongs_to :user
end
