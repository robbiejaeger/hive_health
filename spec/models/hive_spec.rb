require 'rails_helper'

RSpec.describe Hive, type: :model do
  it { should belong_to(:site) }
  it { should have_many(:logs) }
end
