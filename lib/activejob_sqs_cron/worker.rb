# frozen_string_literal: true

module ActivejobSqsCron
  class Worker
    attr_reader :config

    def initialize(config)
      @config = config
      @scheduled_tasks = []
    end

    def start
      register_signal_handlers
      boot
      run
    end

    private

    def register_signal_handlers
      %w[INT TERM QUIT].each do |signal|
        Signal.trap(signal) do
          shutdown
          exit
        end
      end
    end

    def boot
      schedule_tasks
      run_dispatcher
    end

    def run
      loop do
        sleep 60
      end
    end

    def run_dispatcher
      dispatcher.run
    end

    def shutdown
      @scheduled_tasks.each(&:shutdown)
      dispatcher.shutdown
      dispatcher.cleanup
    end

    def dispatcher
      @dispatcher ||= Dispatcher.new
    end

    def schedule_tasks
      @scheduled_tasks = config.job_configs.map do |job_config|
        schedule(job_config)
      end
    end

    def schedule(job_config)
      Scheduler.schedule(dispatcher.queue, job_config)
    end
  end
end
