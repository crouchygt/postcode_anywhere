require "spec_helper"

describe PostcodeAnywhere do
  
  context "Invalid API credentials provided" do
    it "should raise if not API credientials are provided" do
      expect { PostcodeAnywhere.lookup(87, "SW1X 7XL") }.to raise_error
    end
  end
  
  context "Valid API credentials provided" do
    
    before(:each) do
      PostcodeAnywhere.key = "AAAA-BBBB-CCCC-DDDD"
    end
    
    it "should raise if no postcode is provided" do
      expect { PostcodeAnywhere.lookup }.to raise_error
    end
  end
end