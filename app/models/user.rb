class User < ActiveRecord::Base
  enum role: [ :patient, :veterinarian, :admin ]

  has_one :address
  has_one :veterinarian

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
end
