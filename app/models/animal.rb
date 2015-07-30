class Animal < ActiveRecord::Base
  enum gender: [ :samiec, :samica, :mieszana ]

  belongs_to :species
  belongs_to :user
  has_and_belongs_to_many :medical_records

  def custom_label_method
    "ID: #{id_number}, imię: #{name}, wiek: #{trim(age)}, ilość: #{amount}, gatunek: #{species.try(:name)}"
  end

  private

    def trim(num)
      if num.blank?
        "brak"
      else
        i, f = num.to_i, num.to_f
        i == f ? i : f
      end
    end
end
