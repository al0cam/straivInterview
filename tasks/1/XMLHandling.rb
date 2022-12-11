require 'nokogiri'

# doc = Nokogiri.XML(File.open('./tasks/1/xml_uncompressed.xml','r'))
doc = Nokogiri.XML(File.open('./tasks/1/dummy.xml','r'))

root = doc.root
# puts root

puts puts 
# puts root.at_xpath("soapenv:Body")

# p root.xpath("//HotelReservationID[@ResID_Type='10']")

# p root.search("soapenv:Body")

struct = OpenStruct.new
struct.id = root.at_xpath("//HotelReservationID[@ResID_Type='10']").attr("ResID_Value")
struct.external_id = root.at_xpath("//HotelReservationID[@ResID_Type='16']").attr("ResID_Value")
struct.state = root.at_xpath("//HotelReservation").attr("ResStatus")
struct.rate_plan = root.at_xpath("//RatePlanDescription").text.strip
struct.services = root.xpath("//Services/Service").map{ |variable| variable.text.strip}.join(',')


puts struct




