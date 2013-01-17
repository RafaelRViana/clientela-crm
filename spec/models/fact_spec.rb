# -*- encoding : utf-8 -*-
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Fact do
  it { should validate_presence_of(:name) }
  it { should have_many(:notes).dependent(:destroy) }
  it { should have_many(:tasks).dependent(:destroy) }
  it { should have_many(:relationships).dependent(:destroy) }
  it { should have_many(:contacts).through(:relationships) }

  it { should have_many(:subscriptions).dependent(:destroy) }
  it { should have_many(:subscribers).through(:subscriptions).class_name("User") }

  describe "description split" do
    describe "special_fields" do
      it "should recognize two special fields" do
        FactoryGirl.create(:fact).special_fields.should == [["OS", "98394857"], ["Case", "Blasf"]]
      end
    end

    describe "only_description" do
      it "should return description without special fields" do
        FactoryGirl.create(:fact).only_description.should == "Aqui entra de fato a descrição desta ocorrêcnia com tudo o mais..."
      end
    end
  end
end
