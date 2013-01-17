require 'spec_helper'

describe Group do
  it { should validate_presence_of(:name) }
  it { should have_and_belong_to_many(:users) }
  it { should have_many(:permissions).dependent(:destroy) }
end
