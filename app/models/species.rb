class Species < ActiveRecord::Base
  has_many :animal

  validates_presence_of :name

  private

  def self.search(query)
    where("lower(name) like ?", "%#{query.downcase}%")
  end
end
