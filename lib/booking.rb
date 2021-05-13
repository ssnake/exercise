require_relative "booking_type_parser"

class Booking
  def initialize events:, property:
    @id  = property["id"]
    @title = property["title"]
    @events = events
    @event_parser = EventParser.new parser_factory: BookingTypeParser, property_id: @id, platform: "Airbnb"
  end

  def print
    output = ""
    data = @event_parser.parse events: @events
    output << "Booked Dates for #{@title}\n"
    data.each do |key, value|
      output << "#{value[:check_in]} - #{value[:check_out]}\n"
    end
    output
  end
end