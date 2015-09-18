require 'rails_helper'

RSpec.describe Disease, type: :model do
  it { should define_enum_for(:status) }

  it { should have_and_belong_to_many :medical_records }

  it { should validate_presence_of :name }
  it { should validate_presence_of :status }
end
