# frozen_string_literal: true
require_relative "../lib/booking_type_parser"
require_relative "../lib/event_parser"

describe "parse events" do
  let(:events) { JSON.parse(File.read("data/events.json")) }
  let(:properties) { JSON.parse(File.read("data/properties.json")) }
  let(:parser) { EventParser.new(parser_factory: BookingTypeParser, property_id: property["id"], platform: platform) }
  let(:platform) { "Airbnb"}

  context "with first property" do
    let(:property) { properties["properties"].first }

    it "print check in and check out" do
      expect(parser.parse(events: events)).to eq("") 
    end
  end
end