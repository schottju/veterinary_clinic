require 'rails_helper'

RSpec.describe MedicalRecord, type: :model do
  it { should belong_to :user }
  it { should belong_to :veterinarian }
  it { should have_and_belong_to_many :animals }
  it { should have_and_belong_to_many :diseases }
  it { should have_and_belong_to_many :medicines }
  it { should have_and_belong_to_many :treatments }
  it { should have_and_belong_to_many :pictures }

  it { should accept_nested_attributes_for(:medicines).allow_destroy(true) }
end
