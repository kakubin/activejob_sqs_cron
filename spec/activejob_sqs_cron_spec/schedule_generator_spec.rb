# frozen_string_literal: true

RSpec.describe ActivejobSqsCron::ScheduleGenerator do
  describe "#next" do
    subject { schedule_generator.next }

    let(:schedule_generator) { described_class.new(schedule_expression) }
    let(:schedule_expression) { "0 * * * *" }

    before do
      ENV["TZ"] = "Asia/Tokyo"
      allow(Time).to receive(:now).and_return(Time.new(2024, 1, 5, 15, 45, 0).to_i)
    end

    it { is_expected.to eq Time.new(2024, 1, 5, 16, 0, 0).to_i }
  end
end
