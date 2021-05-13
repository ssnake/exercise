require_relative "../lib/booking"
require_relative "../lib/calendar.rb"

class PropertyManager
  def initialize events:, properties:
    @events = events
    @properties = properties
  end  
  
  def print
    output = ""
    @properties["properties"].each do |property|
      calendar = Calendar.new events: @events, property: property
      booking = Booking.new events: @events, property: property
      output << "#{"=" * 40}\n"
      output << "#{property["title"]}\n"
      output << "Bookings:\n#{booking.print}\n"
      output << "Blocked Dates:\n#{calendar.print}\n"
    end
    output
  end

end