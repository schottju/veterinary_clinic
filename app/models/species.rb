class Species < ActiveRecord::Base
  has_many :animal

  validates_presence_of :name

  def custom_label_method
    "##{id} #{name}"
  end

  private

  def self.search(query)
    where("lower(name) like ?", "%#{query.downcase}%")
  end
end
