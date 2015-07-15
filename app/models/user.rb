class User < ActiveRecord::Base
  enum role: [ :patient, :doctor, :admin ]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
end
