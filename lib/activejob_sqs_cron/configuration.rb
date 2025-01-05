# frozen_string_literal: true

require "active_support/configuration_file"

module ActivejobSqsCron
  class Configuration
    DEFAULT_PATH = "config/activejob_sqs_cron.yml"

    attr_reader :options

    def initialize(options)
      @options = default_options.merge(options)
    end

    def job_configs
      config["rules"].map { JobConfig.new(_1) }
    end

    private

    def config
      @config ||= load_config_from_file
    end

    def default_options
      {
        config_file: DEFAULT_PATH,
      }
    end

    def load_config_from_file
      file = Pathname.new(options[:config_file])
      if file.exist?
        ActiveSupport::ConfigurationFile.parse(file)
      else
        {}
      end
    end
  end
end
