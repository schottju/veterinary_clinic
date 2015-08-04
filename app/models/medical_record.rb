class MedicalRecord < ActiveRecord::Base
  belongs_to :user
  belongs_to :veterinarian
  has_and_belongs_to_many :animals
  has_and_belongs_to_many :files
  has_and_belongs_to_many :diseases
  has_and_belongs_to_many :medicines
  has_and_belongs_to_many :treatments
  has_and_belongs_to_many :pictures

  before_save :total_price

  accepts_nested_attributes_for :medicines, reject_if: :all_blank, allow_destroy: true

  def total_price
    sum = medicines.inject(0.0) { |sum, medicine| sum + medicine.price }
    sum += treatments.inject(0.0) { |sum, treatment| sum + treatment.cost  }
    self.total_cost = additional_cost.to_f + sum
  end

  def custom_label_method
    "##{id} właściciel: #{user.try(:full_name)}, weterynarz: #{veterinarian.try(:user).try(:full_name)}"
  end
end
