class Vacation < ActiveRecord::Base
  belongs_to :veterinarian

  def custom_label_method
    "##{id} Od #{start} do #{self.end}"
  end
end
