# frozen_string_literal: true
require 'date'

class EventCalendarUnblocked

  def parse event:, data:, property_id:, platform:
    id = event["data"]["property_id"]
    return if id != property_id
    start_date = event["data"]["start_date"]
    end_date = event["data"]["end_date"]
    note = event["data"]["note"]
    data.each do |index, value |
      new_start_date, new_end_date = unblock(value[:start_date], value[:end_date], start_date, end_date)
      data[index].merge!({ start_date: new_start_date, end_date: new_end_date, note: note})
    end
  end

  private

    def unblock block_start, block_end, unblock_start, unblock_end
      block_start_date = Date.parse(block_start)
      block_end_date = Date.parse(block_end)
      unblock_start_date = Date.parse(unblock_start)
      unblock_end_date = Date.parse(unblock_end)

      return block_start, block_end if unblock_start_date > block_end_date
      return block_start, block_end if unblock_end_date < block_start_date

      if unblock_start_date > block_start_date
        return block_start, unblock_start
      else
        return unblock_start, unblock_end
      end
    end
end