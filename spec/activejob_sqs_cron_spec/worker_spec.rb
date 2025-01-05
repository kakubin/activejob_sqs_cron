# frozen_string_literal: true

RSpec.describe ActivejobSqsCron::Worker do
  describe "#start" do
    subject { worker.start }

    let(:worker) { described_class.new(config) }
    let(:config) { double }

    pending
  end
end
