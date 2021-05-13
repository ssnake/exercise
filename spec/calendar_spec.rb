# frozen_string_literal: true

require_relative "../lib/calendar.rb"

describe "print booking stuff" do
  let(:events) { JSON.parse(File.read("data/events.json")) }
  let(:properties) { JSON.parse(File.read("data/properties.json")) }
  let(:calendar) { Calendar.new(events: events,  property: property) }

  context "with first property" do
    let(:property) { properties["properties"].first }
    it "print blocked dates" do
      expect(calendar.print).to eq("2020-04-01 - 2020-04-08\n2020-02-29 - 2020-03-04\n") 
    end
  end

  context "with second property" do
    let(:property) { properties["properties"].last }
    it "print blocked dates" do
      expect(calendar.print).to eq("2020-03-03 - 2020-03-08\n") 
    end
  end
end