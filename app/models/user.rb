class User < ActiveRecord::Base
  enum role: [ :patient, :veterinarian, :admin ]

  has_one :address
  has_one :veterinarian
  has_one :medical_record
  has_many :animals
  has_many :appointments


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
end
