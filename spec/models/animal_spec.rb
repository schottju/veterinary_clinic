require 'rails_helper'

RSpec.describe Animal, type: :model do
  it { should define_enum_for(:gender) }

  it { should belong_to :species }
  it { should belong_to :user }
  it { should have_many :pictures }
  it { should have_and_belong_to_many :medical_records }

  it { should validate_presence_of :amount }
  it { should validate_presence_of :gender }
  it { should validate_presence_of :species_id }
end
