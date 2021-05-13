# frozen_string_literal: true

class EventCalendarBlocked
  def parse event:, data:, property_id:, platform:
    return if event["data"]["property_id"] != property_id || event["data"]["platform"] != platform
    id = event["data"]["booking_id"]
    check_in = event["data"]["check_in"]
    check_out = event["data"]["check_out"]
    data[id] = { check_in: check_in, check_out: check_out}
  end
end