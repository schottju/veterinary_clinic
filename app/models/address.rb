class Address < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :street, :house_number, :city, :zip_code

  def country_name
      country_full_name = ISO3166::Country[self.country]
      (country_full_name.translations[I18n.locale.to_s] || country_full_name.name) unless country_full_name.nil?
  end

  def custom_label_method
    "##{id} #{street} #{house_number}#{'/' unless flat_number.blank?}#{flat_number} #{zip_code} #{city}"
  end
end
