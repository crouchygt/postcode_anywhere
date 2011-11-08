require "spec_helper"

describe PostcodeAnywhere do
  
  context "Invalid API credentials provided" do
    it "should raise if not API credientials are provided" do
      expect { PostcodeAnywhere.lookup(:number => 87, :postcode => "SW1X 7XL") }.to raise_error
    end
  end
  
  context "Valid API credentials provided" do
    
    before(:each) do
      PostcodeAnywhere.key = "AAAA-BBBB-CCCC-DDDD"
    end
    
    it "should raise if no postcode is provided" do
      expect { PostcodeAnywhere.lookup }.to raise_error
    end
    
    it "should return an address if address is found" do
      success_file = File.open(File.expand_path("../fixtures/success.xml", __FILE__)).read
      FakeWeb.register_uri(:get, "http://services.postcodeanywhere.co.uk/PostcodeAnywhere/Interactive/RetrieveByPostcodeAndBuilding/v1.00/xmle.ws?Key=AAAA-BBBB-CCCC-DDDD&Postcode=SW1X+7XL&Building=87", :body => success_file, :content_type => "application/xml")
      address = PostcodeAnywhere.lookup(:number => 87, :postcode => "SW1X 7XL")
      address.company.should == "Harrods"
      address.line1.should == "87-135 Brompton Road"
    end
  end
end