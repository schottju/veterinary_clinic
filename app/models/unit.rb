class Unit < ActiveRecord::Base
  has_many :medicines

  validates_presence_of :name

  def custom_label_method
    "#{name}"
  end

  private

  def self.search(query)
    where("lower(name) like ?", "%#{query.downcase}%")
  end
end
