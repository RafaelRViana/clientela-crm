require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Entity do
  before(:each) do
    account = mock_model(Account, :id => '42')
    Account.stub(:current).and_return(account)
  end

  it { should have_many(:permissions).dependent(:destroy) }
  it { should have_many(:groups).through(:permissions) }
  it { should have_many(:phones).dependent(:destroy) }
  it { should have_many(:emails).dependent(:destroy) }
  it { should have_many(:addresses).dependent(:destroy) }
  it { should have_many(:websites).dependent(:destroy) }
  it { should have_many(:notes).dependent(:destroy) }
  it { should have_many(:subscriptions).dependent(:destroy) }
  it { should have_many(:subscribers).through(:subscriptions).class_name("User") }

  context "paperclip validations" do
    before do
      mock_paperclip_for(Entity)
    end

    it { should have_attached_file(:photo) }
    # it { should validate_attachment_size(:photo).less_than(1.megabyte) }
    it { should validate_attachment_content_type(:photo).allowing('image/png', 'image/gif', 'image/jpg', 'image/x-png', 'image/pjpeg') }
  end


  describe "nested attributes" do
    { :phones   => [:number], :emails   => [:address],
      :addresses => [:city, :zip, :street, :state ], :websites => [:url] }.each_pair do |attribute, fields|
      describe "nested #{attribute}" do
        it "should accept nested" do
          FactoryGirl.create(:entity_quentin).should respond_to("#{attribute}_attributes=")
        end

        it "should not allow blank values" do
          lambda do
            FactoryGirl.create(:entity_quentin).update_attributes(
              "#{attribute}_attributes" => {
                "new_#{attribute}" => field_hash_to(fields)
              }
            )
          end.should_not change(klass(attribute), :count)
        end
      end

      def klass(attribute)
        attribute.to_s.capitalize.singularize.constantize
      end

      def field_hash_to(fields)
        field_hash = {:kind => "work"}
        fields.map {|field| field_hash[field] = ""}
        field_hash
      end
    end
  end

  describe "small_avatar" do
    it "should return small avatar missing icon" do
      FactoryGirl.create(:entity_quentin).small_avatar.should == "/images/avatar_small.png"
    end
  end
end
