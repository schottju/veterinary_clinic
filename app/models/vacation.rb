class Vacation < ActiveRecord::Base
  belongs_to :veterinarian

  def custom_label_method
    "Od #{start} do #{self.end}"
  end
end
