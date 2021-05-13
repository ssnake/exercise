class Booking
  def initialize events:, property:
    @id  = property["id"]
    @title = property["title"]
    @events = events
    @event_parser = EventParser.new property_id: @id
  end

  def print
    @event_parser.parse events: @events

  end
end