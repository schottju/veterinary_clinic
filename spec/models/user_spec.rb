require 'rails_helper'

RSpec.describe User, type: :model do
  it { should define_enum_for :role }

  it { should have_one :address }
  it { should have_one :veterinarian }
  it { should have_many :medical_records }
  it { should have_many :animals }
  it { should have_many :appointments }
  it { should have_many :pictures }

  it { should accept_nested_attributes_for :address }
  it { should accept_nested_attributes_for :veterinarian }

  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :pesel }
  it { should validate_presence_of :phone_number }
  it { should validate_length_of(:pesel).is_equal_to(11) }
end
