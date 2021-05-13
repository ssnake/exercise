# frozen_string_literal: true

class EventCalendarBlocked
  def parse event:, data:, property_id:, platform:
    id = event["data"]["property_id"]
    return if id != property_id 
    start_date = event["data"]["start_date"]
    end_date = event["data"]["end_date"]
    note = event["data"]["note"]
    data[data.keys.count] = { start_date: start_date, end_date: end_date, note: note}
  end
end