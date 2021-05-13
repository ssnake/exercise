# frozen_string_literal: true
require "json"
require_relative "lib/property_manager"

manager = PropertyManager.new(events: JSON.parse(File.read("data/events.json")),  properties: JSON.parse(File.read("data/properties.json")))
puts(manager.print)