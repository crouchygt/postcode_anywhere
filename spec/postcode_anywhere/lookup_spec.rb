require "spec_helper"

describe PostcodeAnywhere::Lookup do
  context "found valid postcode" do
    
    before(:each) do
      success_file = File.open(File.expand_path("../../fixtures/success.xml", __FILE__)).read
      FakeWeb.register_uri(:get, "http://services.postcodeanywhere.co.uk/PostcodeAnywhere/Interactive/RetrieveByPostcodeAndBuilding/v1.00/xmle.ws?Key=AAAA-BBBB-CCCC-DDDD&Postcode=SW1X+7XL&Building=87", :body => success_file, :content_type => "application/xml")
    end
    
    it "should return address" do
      address = PostcodeAnywhere::Lookup.lookup(:number => 87, :postcode => "SW1X 7XL")
      address.company.should == "Harrods"
      address.line1.should == "87-135 Brompton Road"
    end
  end
end