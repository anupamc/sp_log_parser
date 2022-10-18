# frozen_string_literal: true

require 'tempfile'

RSpec.describe LogProcessor::LogReader do
  let(:tempfile) { Tempfile.new('webserver_log') }

  describe '#log_reader' do
    context 'reads the raw log' do
      subject { described_class.new(path).send(:log_reader) }

      let(:path) { tempfile.path }

      it 'returns the Enumerator' do
        expect(subject.class).to eq(Enumerator)
      end
    end
  end
end
