# frozen_string_literal: true

require_relative "event_calendar_blocked"
require_relative "event_calendar_unblocked"

module CalendarTypeParser
  def self.new type
    return EventCalendarBlocked.new if type == "CalendarBlocked"
    return EventCalendarUnblocked.new if type == "CalendarUnblocked"
  end
end