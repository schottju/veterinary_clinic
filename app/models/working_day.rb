class WorkingDay < ActiveRecord::Base
  belongs_to :veterinarian

  def custom_label_method
    "##{id} #{'Pon' if monday} #{'Wt' if tuesday} #{'Śr' if wednesday} #{'Czw' if thursday}
     #{'Pt' if friday} #{'Sob' if saturday} #{'Niedz' if sunday}"
  end
end
