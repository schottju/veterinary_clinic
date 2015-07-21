class Disease < ActiveRecord::Base
  has_and_belongs_to_many :medical_records

  validates_presence_of :name

  private

  def self.search(query)
    where("lower(name) like ?", "%#{query.downcase}%")
  end
end
