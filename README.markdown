Postcode Anywhere
=================

A simple plugin for Rails 3 to find addresses by postcode and building number using the Postcode Anywhere service.

Usage
-----

First you must supply the class with a valid Postcode Anywhere key, you can do this in a Rails initializer.

PostcodeAnywhere.key = "YOUR-VALID-KEY"

To perform a lookup:

PostcodeAnywhere.find_by_number_and_postcode(87, "SW1X 7XL")

(Harrods London)

A hash will then be returned with the address details:

{"Udprn"=>"0", "Company"=>nil, "Department"=>nil, "Line1"=>"87 Brompton Road", "Line2"=>nil, "Line3"=>nil, "Line4"=>nil, "Line5"=>nil, "PostTown"=>"London", "County"=>nil, "Postcode"=>"SW1X 7XL", "Mailsort"=>"72114", "Barcode"=>"(SW1X7XL9Z9)", "Type"=>"Residential", "DeliveryPointSuffix"=>"9Z", "SubBuilding"=>nil, "BuildingName"=>nil, "BuildingNumber"=>"87", "PrimaryStreet"=>"Brompton Road", "SecondaryStreet"=>nil, "DoubleDependentLocality"=>nil, "DependentLocality"=>nil, "PoBox"=>nil}