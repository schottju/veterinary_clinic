class Address < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :street, :house_number, :city, :zip_code
end
