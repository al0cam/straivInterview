require 'nokogiri'

doc = Nokogiri.XML(File.open('xml_uncompressed.xml','r'))
# doc = Nokogiri.XML(File.open('./tasks/1/helper.xml','r'))

root = doc.root
# puts root

puts puts 
puts root.at_xpath("soapenv:Body")

p root.at_xpath("//HotelReservationID[@ResID_Type='10']")

p root.search("soapenv:Body")

puts "ye"

puts "cancer"

# puts root.at_xpath("//Item[@filename='AGC_1164.jpg']")