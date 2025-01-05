# frozen_string_literal: true

require "fugit"

module ActivejobSqsCron
  class ScheduleGenerator
    def initialize(schedule_expression)
      @schedule_expression = schedule_expression
      @parsed_schedule = Fugit.parse(@schedule_expression)
    end

    def next
      @parsed_schedule.next_time.seconds
    end
  end
end
