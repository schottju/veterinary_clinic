class User < ActiveRecord::Base
  enum role: [ :patient, :veterinarian, :admin ]

  has_one :address
  has_one :veterinarian
  has_many :medical_record
  has_many :animals
  has_many :appointments

  validates_presence_of :first_name, :last_name, :pesel, :phone_number, :email, :password, :password_confirmation

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
end
