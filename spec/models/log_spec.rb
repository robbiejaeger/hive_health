require 'rails_helper'

RSpec.describe Log, type: :model do
  it { should belong_to(:hive) }
end
