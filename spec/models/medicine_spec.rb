require 'rails_helper'

RSpec.describe Medicine, type: :model do
  it { should belong_to :unit }
  it { should have_and_belong_to_many :medical_records }

  it { should validate_presence_of :name }
  it { should validate_presence_of :amount }
  it { should validate_presence_of :grace_period }
  it { should validate_presence_of :price }
  it { should validate_presence_of :unit_id }
end
