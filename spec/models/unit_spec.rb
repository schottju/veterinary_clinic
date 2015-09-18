require 'rails_helper'

RSpec.describe Unit, type: :model do
  it { should define_enum_for :status }

  it { should have_many :medicines }

  it { should validate_presence_of :name }
  it { should validate_presence_of :status }
end
