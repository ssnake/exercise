# frozen_string_literal: true

class EventParser
  def initialize parser_factory:, property_id:, platform:
    @id = property_id
    @platform = platform
    @events_data = {}
    @parser_factory = parser_factory
  end

  def parse events:
    events["events"].each do |event|
      type_parser = @parser_factory.new event["type"]
      next if type_parser.nil?
        
      type_parser.parse event: event, data: @events_data, property_id: @id, platform: @platform
    end
    @events_data
  
  end

  private
    
end