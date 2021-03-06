# frozen_string_literal: true

require_relative "../lib/booking"

describe "print booking stuff" do
  let(:events) { JSON.parse(File.read("data/events.json")) }
  let(:properties) { JSON.parse(File.read("data/properties.json")) }
  let(:booking) { Booking.new(events: events,  property: property) }

  context "with first property" do
    let(:property) { properties["properties"].first }
    it "print check in and check out" do
      expect(booking.print).to eq("2020-02-23 - 2020-02-27\n2020-02-27 - 2020-02-29\n") 
    end
  end
  context "with second property" do
    let(:property) { properties["properties"].last }
    it "print check in and check out" do
      expect(booking.print).to eq("2020-02-27 - 2020-03-01\n") 
    end
  end
end