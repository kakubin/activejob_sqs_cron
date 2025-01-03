# frozen_string_literal: true

module ActivejobSqsCron
  class Scheduler
    class << self
      def schedule(queue, job_config)
        scheduler = new(queue, job_config)
        scheduler.start
        scheduler
      end
    end

    attr_reader :iterator, :next_time

    def initialize(queue, job_config)
      @queue = queue
      @job_config = job_config
      @iterator = ScheduleIterator.new(job_config.schedule_expression)
      @next_time = @iterator.next
    end

    def start
      @t = Thread.new do
        loop do
          next commit_job if should_commit?

          sleep 0.1
        end
      end
    end

    private

    def should_commit?
      Time.now.to_i > next_time
    end

    def commit_job
      @queue.push(job_class: @job_config.job_class, time: Time.now)
    ensure
      @next_time = iterator.next
    end
  end
end
