module PostcodeAnywhere
  class Address
    attr_accessor :udprn, :company, :department, :line1, :line2, :line3, :line4, :line5, :town, :county, :postcode, :mailsort, :barcode, :address_type, :name, :number, :primary_street, :secondary_street, :double_dependent_locality, :dependent_locality, :po_box
  end
end