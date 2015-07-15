class User < ActiveRecord::Base
  enum role: [ :patient, :doctor, :admin ]

  has_one :address

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
end
