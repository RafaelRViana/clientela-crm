require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Phone do
  it { should validate_presence_of(:number) }
  it { should validate_presence_of(:kind) }
  it { should belong_to(:entity) }

  it "should return phone kind" do
    Phone.kinds.should == [:work, :home, :mobile, :nextel, :fax, :skype, :other]
  end
end
