# frozen_string_literal: true

RSpec.describe ActivejobSqsCron::JobConfig do
  describe "attributes" do
    subject { job_config }

    let(:job_config) { described_class.new({ "name" => "job_name", "schedule_expression" => "0 0 * * *", "job_class" => "DailyBatchJob" }) }

    it { is_expected.to have_attributes(name: "job_name", schedule_expression: "0 0 * * *", job_class: "DailyBatchJob") }
  end
end
