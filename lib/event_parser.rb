# frozen_string_literal: true

require_relative "event_type_parser"

class EventParser
  def initialize property_id:, platform:
    @id = property_id
    @platform = platform
    @events_data = {}
  end

  def parse events:
    events["events"].each do |event|
      type_parser = EventTypeParser.new event["type"]
      raise "type parser for #{event["type"]} is not implemented" if type_parser.nil?
        
      type_parser.parse event: event, data: @events_data
    end
  
  end

  private
    
end