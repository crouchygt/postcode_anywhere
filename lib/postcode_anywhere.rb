require "httparty"
require "postcode_anywhere/validator"
require "postcode_anywhere/lookup"
require "postcode_anywhere/address"

module PostcodeAnywhere
  
  class << self
    
    attr_accessor :key
    
    def license_key
      @key
    end
  end
  
  def self.lookup(options = {})
    validate_key
    validate_postcode(options[:postcode])
    return find_postcode(options)
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
  
  def self.find_postcode(options)
    PostcodeAnywhere::Lookup.lookup(:number => options[:number], :postcode => options[:postcode])
  end
  
  class PostcodeAnywhereException < StandardError;end
  class PostcodeAnywhereException::InvalidPostCode < StandardError;end
  
end