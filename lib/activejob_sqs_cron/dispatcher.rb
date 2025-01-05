# frozen_string_literal: true

module ActivejobSqsCron
  class Dispatcher
    include Shutdownable

    attr_reader :queue

    def initialize
      @queue = Queue.new
    end

    def run
      @t = Thread.new do
        loop do
          while (resource = queue.pop(timeout: 3))
            enqueue(resource)
          end
          break if shutting_down?
        end
      end
    end

    def cleanup
      enqueue(queue.pop) until queue.empty?
    end

    private

    def enqueue(resource)
      klass_name = resource[:job_class]
      klass = Object.const_get(klass_name)
      klass.perform_later(resource[:time])
    end
  end
end
