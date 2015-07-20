class User < ActiveRecord::Base
  include Gravtastic
  gravtastic default: 'mm', secure: true, rating: 'PG'

  enum role: [ :patient, :veterinarian, :admin ]

  has_one :address
  has_one :veterinarian
  has_many :medical_record
  has_many :animals
  has_many :appointments

  accepts_nested_attributes_for :address

  validates_presence_of :first_name, :last_name, :pesel
  validates :pesel, length: { is: 11 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  def update_attributes(params)
    if params[:password].blank?
      params.delete :password
      params.delete :password_confirmation
      super params
    end
  end

  private

  def self.search(query)
    where("(lower(last_name) like :q OR lower(first_name) like :q) AND role = 0", { q: "%#{query.downcase}%" })
  end
end
