require "cgi"
module PostcodeAnywhere
  
  SERVICE_ADDRESS = "http://services.postcodeanywhere.co.uk/PostcodeAnywhere/Interactive/RetrieveByPostcodeAndBuilding/v1.00/xmle.ws"
  
  include HTTParty
  format :xml
  
  class Lookup
    def self.lookup(options)
      results = PostcodeAnywhere.get(SERVICE_ADDRESS+"?Key=#{PostcodeAnywhere.key}&Postcode=#{CGI::escape(options[:postcode])}&Building=#{options[:number]}")
      address = Address.new
      address.line1 = results["Table"]["Row"]["Line1"]
      address.company = results["Table"]["Row"]["Company"]
      address
    end
  end
end