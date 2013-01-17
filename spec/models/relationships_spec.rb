require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Relationship do
  it { should belong_to(:entity) }
  it { should belong_to(:contact) }
  it { should validate_presence_of(:entity) }
  it { should validate_presence_of(:contact) }
  it { Relationship.on_deals.to_sql.should == %{SELECT "relationships".* FROM "relationships"  WHERE "relationships"."entity_type" = 'Deal'}}
  it { Relationship.on_facts.to_sql.should == %{SELECT "relationships".* FROM "relationships"  WHERE "relationships"."entity_type" = 'Fact'}}
end
