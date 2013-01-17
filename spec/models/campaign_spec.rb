require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Campaign do
  it { should have_many(:notes) }
  it { should have_many(:tasks) }
  it { should validate_presence_of(:name) }
  it { should ensure_inclusion_of(:status).in_array(["planned", "started", "completed", "hold", "canceled"]) }
end