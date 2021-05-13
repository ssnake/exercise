# frozen_string_literal: true

require_relative "../lib/property_manager"

describe "print property details" do
  let(:events) { JSON.parse(File.read("data/events.json")) }
  let(:properties) { JSON.parse(File.read("data/properties.json")) }
  let(:manager) { PropertyManager.new(events: events,  properties: properties) }

  xit "print check in and check out" do
    expect(manager.print).to eq("") 
  end
  
end