# frozen_string_literal: true

require_relative "event_booking_confirmed"
require_relative "event_booking_extended"

module BookingTypeParser
  def self.new type
    return EventBookingConfirmed.new if type == "BookingConfirmed"
    return EventBookingExtended.new if type == "BookingExtended"
    
  end
end