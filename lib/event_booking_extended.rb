# frozen_string_literal: true

class EventBookingExtended
  def parse event:, data:, property_id:, platform:
    id = event["data"]["booking_id"]
    check_out = event["data"]["check_out"]
    data[id].merge!({check_out: check_out}) unless data[id].nil?
  end
end