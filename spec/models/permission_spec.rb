require 'spec_helper'

describe Permission do
  it { should validate_presence_of(:group) }
  it { should belong_to(:group) }
  it { should belong_to(:referred) }
end
