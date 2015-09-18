require 'rails_helper'

RSpec.describe Species, type: :model do
  it { should define_enum_for :status }

  it { should have_many :animal }

  it { should validate_presence_of :name }
  it { should validate_presence_of :status }
end
