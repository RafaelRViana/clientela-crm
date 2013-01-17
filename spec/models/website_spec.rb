require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Website do
  it { should belong_to(:entity) }
  it { should validate_presence_of(:url) }
  it { should ensure_inclusion_of(:kind).in_array(["work", "personal", "blog", "other"]) }

  it "should return website kind" do
    Website.kinds.should == ["work", "personal", "blog", "other"]
  end
end
