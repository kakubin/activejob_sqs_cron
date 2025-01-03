# frozen_string_literal: true

require "fugit"

module ActivejobSqsCron
  class ScheduleIterator
    def initialize(schedule_expression)
      @schedule_expression = schedule_expression
    end

    def next
      parsed_schedule.next_time.seconds
    end

    private

    def parsed_schedule
      @parsed_schedule ||= Fugit.parse(@schedule_expression)
    end
  end
end
