require 'rails_helper'

RSpec.describe Vacation, type: :model do
  it { should belong_to :veterinarian }

  it { should validate_presence_of :start }
  it { should validate_presence_of :end }
end
