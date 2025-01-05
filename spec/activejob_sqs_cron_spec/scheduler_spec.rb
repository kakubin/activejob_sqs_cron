# frozen_string_literal: true

RSpec.describe ActivejobSqsCron::Scheduler do
  describe ".schedule" do
    subject { described_class.schedule(queue, job_config) }

    let(:queue) { double }
    let(:job_config) { ActivejobSqsCron::JobConfig.new({ "name" => "job_name", "schedule_expression" => "0 0 * * *", "job_class" => "DailyBatchJob" }) }

    it { is_expected.to be_a described_class }
  end
end
