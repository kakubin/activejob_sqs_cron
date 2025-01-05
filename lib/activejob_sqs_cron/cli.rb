# frozen_string_literal: true

module ActivejobSqsCron
  class CLI
    def self.run(*)
      new.run
    end

    def run
      config = Configuration.new({})
      worker = Worker.new(config)
      worker.start
    end
  end
end
