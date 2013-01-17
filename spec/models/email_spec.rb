require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Email do
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:kind) }
  it { should belong_to(:entity) }

  describe "kinds" do
    it "should return email kind" do
      Email.kinds.should == [:work, :home, :other]
    end
  end
end
