require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TaskCategory do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:color) }
end
