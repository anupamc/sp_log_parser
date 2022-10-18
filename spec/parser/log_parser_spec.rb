# frozen_string_literal: true

require 'tempfile'

RSpec.describe LogProcessor::LogParser do
  subject { described_class.new(path).call }

  let(:tempfile) do
    Tempfile.new('webserver_log').tap do |file|
      data_arr.each { |line| file << "#{line}\n" }
      file.close
    end
  end

  let(:data_arr) do
    [
      '/help_page/1 126.318.035.038',
      '/contact 184.123.665.067',
      '/home 184.123.665.067',
      '/about/2 444.701.448.104',
      '/help_page/1 929.398.951.889',
      '/index 444.701.448.104',
      '/help_page/1 722.247.931.582'
    ]
  end

  describe '#call' do
    context 'when file can be found' do
      let(:path) { tempfile.path }

      it 'returns the array of lines' do
        expect(subject.class).to eq(Array)
        expect(subject.size).to eq 2
      end
    end

    context	'when file can not be found' do
      let(:path) { 'some/random/path' }

      it 'throws an error' do
        expect { subject }.to raise_error("Couldn't find file in the given path: some/random/path")
      end
    end
  end
end
