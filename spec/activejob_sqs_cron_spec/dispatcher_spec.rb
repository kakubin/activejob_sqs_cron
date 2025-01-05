# frozen_string_literal: true

RSpec.describe ActivejobSqsCron::Dispatcher do
  describe "#queue" do
    subject { dispatcher.queue }

    let(:dispatcher) { described_class.new }

    it { is_expected.to be_a Queue }
  end

  describe "#run" do
    subject { dispatcher.run }

    let(:dispatcher) { described_class.new }

    pending
  end

  describe "#cleanup" do
    subject { dispatcher.cleanup }

    let(:dispatcher) { described_class.new }

    pending
  end
end
