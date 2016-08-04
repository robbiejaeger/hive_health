require 'rails_helper'

RSpec.describe Follow, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:site) }
end
