# frozen_string_literal: true

module ActivejobSqsCron
  class Worker
    attr_reader :config

    def initialize(config)
      @config = config
      @scheduled_tasks = []
    end

    def start
      schedule_tasks

      while (resource = queue.pop)
        klass_name = resource[:job_class]
        klass = Object.const_get(klass_name)
        klass.perform_later(resource[:time])
      end
    end

    private

    def queue
      @queue ||= Queue.new
    end

    def schedule_tasks
      @scheduled_tasks = config.job_configs.map do |job_config|
        schedule(job_config)
      end
    end

    def schedule(job_config)
      Scheduler.schedule(queue, job_config)
    end
  end
end
