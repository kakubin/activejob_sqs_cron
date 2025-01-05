# frozen_string_literal: true

RSpec.describe ActivejobSqsCron::Configuration do
  describe "#job_configs" do
    subject { configuration.job_configs }

    let(:configuration) { described_class.new(config_file: "./spec/fixtures/dummy_config.yml") }

    it do
      is_expected.to satisfy do |job_configs|
        expect(job_configs).to be_a Array
        expect(job_configs.first).to be_a ActivejobSqsCron::JobConfig
      end
    end
  end
end
