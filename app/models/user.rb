class User < ActiveRecord::Base
  enum role: [ :patient, :veterinarian, :admin ]

  has_one :address
  has_one :veterinarian
  has_many :animals

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
end
