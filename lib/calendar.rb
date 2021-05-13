require_relative "calendar_type_parser"
require_relative "event_parser"

class Calendar

  def initialize events:, property:
    @id  = property["id"]
    @events = events
    @event_parser = EventParser.new parser_factory: CalendarTypeParser, property_id: @id, platform: "Airbnb"
  end

  def print
    output = ""
    data = @event_parser.parse events: @events
    data.each do |key, value|
      output << "#{value[:start_date]} - #{value[:end_date]}\n"
    end
    output
  end
end