class Disease < ActiveRecord::Base
  has_and_belongs_to_many :medical_records

  validates_presence_of :name

  def custom_label_method
    "##{id} #{name}"
  end

  private

  def self.search(query)
    where("lower(name) like ?", "%#{query.downcase}%")
  end
end
