class Medicine < ActiveRecord::Base
  belongs_to :unit
  has_and_belongs_to_many :medical_records

  def custom_label_method
    "#{name}"
  end
end
