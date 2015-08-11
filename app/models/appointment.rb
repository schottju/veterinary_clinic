class Appointment < ActiveRecord::Base
  enum kind: [ 'w klinice', :domowa ]
  enum status: [ :niezatwierdzona, :zatwierdzona ]
  enum time: [  'jak najszybciej', :rano, 'w południe', :wieczorem, 'w nocy' ]

  belongs_to :user
  belongs_to :veterinarian

  validates_presence_of :kind, :day, :time, :description, :veterinarian_id

  def custom_label_method
    "##{id} Dzień: #{day}, godzina: #{time}, rodzaj: #{kind}"
  end

  private

    def self.search(query, user_id)
      where("to_char(day, 'YYYY-MM-DD') like :q AND user_id = :u AND day >= :d", { q: "%#{query}%", u: user_id, d: Date.today })
    end

    def self.veterinarian_search(query, veterinarian_id)
      where("to_char(day, 'YYYY-MM-DD') like :q AND veterinarian_id = :v AND day >= :d", { q: "%#{query}%", v: veterinarian_id, d: Date.today })
    end
end
