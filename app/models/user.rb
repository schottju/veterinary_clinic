class User < ActiveRecord::Base
  enum role: [ :user, :doctor, :admin ]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
end
