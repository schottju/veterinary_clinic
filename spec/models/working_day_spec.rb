require 'rails_helper'

RSpec.describe WorkingDay, type: :model do
  it { should belong_to :veterinarian }
end
