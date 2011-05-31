require "httparty"
class PostcodeAnywhere
  
  include HTTParty
  format :xml

  SERVICE_ADDRESS = "http://services.postcodeanywhere.co.uk/PostcodeAnywhere/Interactive/RetrieveByPostcodeAndBuilding/v1.00/xmle.ws"
  POSTCODE_ANYWHERE_KEY = 0
    
  def self.find_by_number_and_postcode(number, postcode)
    validate_key
    sanitised_postcode = postcode.gsub(/\s/, "")
    data = lookup(number, sanitised_postcode)
    data["Table"]["Row"]
  end
  
  protected
  
  def validate_key
    if POSTCODE_ANYWHERE_KEY == 0
      raise PostcodeAnywhereException, "Please provide a valid Postcode Anywhere License Key"
    end
  end

  def lookup(number, postcode)
    PostcodeAnywhere.get SERVICE_ADDRESS+"?Key=#{POSTCODE_ANYWHERE_KEY}&Postcode=#{postcode}&Building=#{number}"
  end
end
class PostcodeAnywhereException < StandardError;end