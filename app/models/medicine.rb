class Medicine < ActiveRecord::Base
  belongs_to :unit
  has_and_belongs_to_many :medical_records

  def custom_label_method
    "##{id} #{name}, ilość: #{amount} #{unit.try(:name)}"
  end
end
