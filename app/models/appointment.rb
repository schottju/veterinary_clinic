class Appointment < ActiveRecord::Base
  enum kind: [ 'w klinice', :domowa ]
  enum status: [ :niezatwierdzona, :zatwierdzona ]
  enum time: [ 'brak', :rano, 'w południe', 'jak najszybciej', :wieczorem, 'w nocy' ]

  belongs_to :user
  belongs_to :veterinarian

  validates_presence_of :kind, :day, :time, :description

  def custom_label_method
    "##{id} Dzień: #{day}, godzina: #{time}, rodzaj: #{kind}"
  end
end
