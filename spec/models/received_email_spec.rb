require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ReceivedEmail do
  it { should have_one(:note) }
end
