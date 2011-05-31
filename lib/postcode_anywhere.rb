require "httparty"
module PostcodeAnywhere
  
  SERVICE_ADDRESS = "http://services.postcodeanywhere.co.uk/PostcodeAnywhere/Interactive/RetrieveByPostcodeAndBuilding/v1.00/xmle.ws"
  
  include HTTParty
  format :xml
  
  class << self
    
    attr_accessor :key
    
    def license_key
      @key
    end
  end
  
  def self.find_by_number_and_postcode(number, postcode)
    PostcodeAnywhere.validate_key
    sanitised_postcode = postcode.gsub(/\s/, "")
    data = PostcodeAnywhere.lookup(number, sanitised_postcode)
    data["Table"]["Row"]
  end
  
  protected
  
  def self.validate_key
    unless PostcodeAnywhere.key
      raise PostcodeAnywhereException, "Please provide a valid Postcode Anywhere License Key"
    end
  end

  def self.lookup(number, postcode)
    PostcodeAnywhere.get SERVICE_ADDRESS+"?Key=#{PostcodeAnywhere.key}&Postcode=#{postcode}&Building=#{number}"
  end
  
  class PostcodeAnywhereException < StandardError;end
  
end