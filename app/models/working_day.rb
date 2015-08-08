class WorkingDay < ActiveRecord::Base
  belongs_to :veterinarian

  validates_presence_of :veterinarian_id

  def custom_label_method
    "##{id} #{'Pon' if monday} #{'Wt' if tuesday} #{'Śr' if wednesday} #{'Czw' if thursday}
     #{'Pt' if friday} #{'Sob' if saturday} #{'Niedz' if sunday}"
  end
end
