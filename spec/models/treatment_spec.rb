require 'rails_helper'

RSpec.describe Treatment, type: :model do
  it { should define_enum_for :status }

  it { should have_and_belong_to_many :medical_records }

  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :status }
  it { should validate_numericality_of(:cost).is_greater_than_or_equal_to(0) }
  it { should allow_value(2.0).for(:cost) }
end
