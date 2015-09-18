require 'rails_helper'

RSpec.describe Picture, type: :model do
  it { should belong_to :user }
  it { should belong_to :animal }
  it { should have_and_belong_to_many :medical_records }

  it { should validate_presence_of :name }
  it { should validate_presence_of :image }
end
