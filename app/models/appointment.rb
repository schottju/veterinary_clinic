class Appointment < ActiveRecord::Base
  enum kind: [ :office, :home ]
  enum status: [ :pending, :accepted ]

  belongs_to :user
  belongs_to :veterinarian

  def custom_label_method
    "Dzień: #{day}, godzina: #{time}, rodzaj: #{kind}"
  end
end
