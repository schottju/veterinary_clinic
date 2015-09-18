require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it { should define_enum_for(:kind) }
  it { should define_enum_for(:status) }
  it { should define_enum_for(:time) }

  it { should belong_to :user }
  it { should belong_to :veterinarian }

  it { should validate_presence_of :kind }
  it { should validate_presence_of :day }
  it { should validate_presence_of :time }
  it { should validate_presence_of :description }
  it { should validate_presence_of :veterinarian_id }
end
