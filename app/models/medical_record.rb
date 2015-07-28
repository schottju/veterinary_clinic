class MedicalRecord < ActiveRecord::Base
  belongs_to :user
  belongs_to :veterinarian
  has_and_belongs_to_many :animals
  has_and_belongs_to_many :files
  has_and_belongs_to_many :diseases
  has_and_belongs_to_many :medicines
  has_and_belongs_to_many :treatments

  def custom_label_method
    "Karta nr #{id}"
  end
end
