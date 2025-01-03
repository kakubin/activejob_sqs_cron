# frozen_string_literal: true

module ActivejobSqsCron
  class JobConfig
    attr_reader :name, :schedule_expression, :job_class

    def initialize(setting)
      @name = setting.fetch("name")
      @schedule_expression = setting.fetch("schedule_expression")
      @job_class = setting.fetch("job_class")
    end
  end
end
