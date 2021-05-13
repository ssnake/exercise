# frozen_string_literal: true

require_relative "event_booking_confirmed"

module BookingTypeParser
  def self.new type
    return EventBookingConfirmed.new if type == "BookingConfirmed"
    
  end
end