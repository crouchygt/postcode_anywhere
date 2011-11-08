require "httparty"
require "postcode_anywhere/validator"

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
  
  def self.lookup(options = {})
    validate_key
    validate_postcode(options[:postcode])
    # sanitised_postcode = postcode.gsub(/\s/, "")
    #     data = PostcodeAnywhere.lookup(number, sanitised_postcode)
    #     data["Table"]["Row"]
  end
  
  protected
  
  def self.validate_key
    unless PostcodeAnywhere.key
      raise PostcodeAnywhereException, "Please provide a valid Postcode Anywhere License Key"
    end
  end
  
  def self.validate_postcode(postcode = "")
    unless PostcodeAnywhere::Validator.valid_postcode?(postcode)
      raise PostcodeAnywhereException::InvalidPostCode
    end
  end

  def self.call(number, postcode)
    PostcodeAnywhere.get SERVICE_ADDRESS+"?Key=#{PostcodeAnywhere.key}&Postcode=#{postcode}&Building=#{number}"
  end
  
  class PostcodeAnywhereException < StandardError;end
  class PostcodeAnywhereException::InvalidPostCode < StandardError;end
  
end