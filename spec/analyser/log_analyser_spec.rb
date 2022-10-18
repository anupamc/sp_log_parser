# frozen_string_literal: true

RSpec.describe LogProcessor::LogAnalyser do
  subject { described_class.new.call(data_hash) }

  let(:data_arr) do
    [
      '/help_page/1 126.318.035.038',
      '/contact 184.123.665.067',
      '/home 184.123.665.067',
      '/about/2 444.701.448.104',
      '/help_page/1 929.398.951.889',
      '/index 444.701.448.104',
      '/contact 184.123.665.067',
      '/about/2 444.701.448.104',
      '/home 184.123.665.067',
      '/help_page/1 722.247.931.582',
      '/about/2 722.247.931.582'
    ]
  end

  describe '#call' do
    context 'when the hash of total page received' do
      let(:data_hash) do
        visited_path = Hash.new { |h, k| h[k] = [] }
        data_arr.each do |row|
          splited_row = row.split(' ')
          visited_path[splited_row[0]] << splited_row[1]
        end
        visited_path
      end

      let(:expected_result) do
        { '/about/2' => 3, '/contact' => 2, '/help_page/1' => 3, '/home' => 2, '/index' => 1 }
      end

      it 'returns hash with value count' do
        expect(subject).to eq(expected_result)
      end
    end

    context 'when the hash of unique page received' do
      let(:data_hash) do
        uniq_path = Hash.new { |h, k| h[k] = Set.new }
        data_arr.each do |row|
          splited_row = row.split(' ')
          uniq_path[splited_row[0]] << splited_row[1]
        end
        uniq_path
      end

      let(:expected_result) do
        { '/about/2' => 2, '/contact' => 1, '/help_page/1' => 3, '/home' => 1, '/index' => 1 }
      end

      it 'returns hash with value count' do
        expect(subject).to eq(expected_result)
      end
    end
  end
end
