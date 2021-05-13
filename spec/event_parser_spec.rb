# frozen_string_literal: true
require_relative "../lib/booking_type_parser"
require_relative "../lib/calendar_type_parser"
require_relative "../lib/event_parser"

describe "parse events" do
  let(:events) { JSON.parse(File.read("data/events.json")) }
  let(:properties) { JSON.parse(File.read("data/properties.json")) }
  let(:parser) { EventParser.new(parser_factory: type_parser, property_id: property["id"], platform: platform) }
  let(:platform) { "Airbnb"}

  context "with booking type parser" do
    let(:type_parser) { BookingTypeParser }
  
    context "with first property" do
      let(:property) { properties["properties"].first }

      it "print check in and check out" do
        expect(parser.parse(events: events)).to eq({"abcdef123"=>{:check_in=>"2020-02-23", :check_out=>"2020-02-27"}, "abcdef130"=>{:check_in=>"2020-02-27", :check_out=>"2020-02-29"}}) 
      end
    end

    context "with second property" do
      let(:property) { properties["properties"].last }

      it "print check in and check out" do
        expect(parser.parse(events: events)).to eq("abcdef128" => {:check_in=>"2020-02-27", :check_out=>"2020-03-01"}) 
      end
    end
  end

  context "with calendar type parser" do
    let(:type_parser) { CalendarTypeParser }
  
    context "with first property" do
      let(:property) { properties["properties"].first }

      it "print check in and check out" do
        expect(parser.parse(events: events)).to eq({0 => {:end_date=>"2020-04-08", :note=>"Refurbishment works taking place", :start_date=>"2020-04-01"},1 => {:end_date=>"2020-03-04", :note=>"Refurbishment works taking place", :start_date=>"2020-02-29"},}) 
      end
    end

    context "with second property" do
      let(:property) { properties["properties"].last }

      it "print check in and check out" do
        expect(parser.parse(events: events)).to eq({0 => {:end_date=>"2020-03-08", :note=>"Refurbishment works taking place", :start_date=>"2020-03-03"}}) 
      end
    end
  end
end