# frozen_string_literal: true

module ActivejobSqsCron
  module Shutdownable
    attr_accessor :shutting_down

    def shutdown
      self.shutting_down = true
      @t.join
    end

    def shutting_down?
      shutting_down
    end
  end
end
