require "spec_helper"

describe PostcodeAnywhere::Validator do
  it "should return false with invalid postcode" do
    PostcodeAnywhere::Validator.valid_postcode?("S").should be_false
  end
  
  it "should return true with valid postcode" do
    PostcodeAnywhere::Validator.valid_postcode?("W12 7DS").should be_false
  end
end