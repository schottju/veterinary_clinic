require 'rails_helper'

RSpec.describe Veterinarian, type: :model do
  it { should belong_to :user }
  it { should have_many :medical_records }
  it { should have_many :appointments }
  it { should have_many :vacations }
  it { should have_one :working_day }

  it { should accept_nested_attributes_for :working_day }

  it { should validate_presence_of :title }
  it { should validate_presence_of :pwz }
end
