# frozen_string_literal: true
require_relative "booking_type_parser"
class Booking
  def initialize events:, property:
    @id  = property["id"]
    @title = property["title"]
    @events = events
    @event_parser = EventParser.new parser_factory: BookingTypeParser, property_id: @id
  end

  def print
    @event_parser.parse events: @events

  end
end