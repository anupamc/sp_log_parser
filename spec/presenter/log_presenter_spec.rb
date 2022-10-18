# frozen_string_literal: true

RSpec.describe LogProcessor::LogPresenter do
  subject { described_class.new(views_data, type).call }

  describe '#call' do
    context 'when total view to be presented' do
      let(:views_data) { { '/about/2' => 3, '/contact' => 2, '/help_page/1' => 3, '/home' => 2, '/index' => 1 } }
      let(:type) { :total }
      let(:expected_result) do
        { '/about/2' => 3, '/contact' => 2, '/help_page/1' => 3, '/home' => 2, '/index' => 1 }
      end

      it 'returns the total view' do
        expect(subject).to eq(expected_result)
      end
    end

    context 'when uniq view to be presented' do
      let(:views_data) { { '/about/2' => 2, '/contact' => 1, '/help_page/1' => 3, '/home' => 1, '/index' => 1 } }
      let(:type) { :unique }
      let(:expected_result) do
        { '/about/2' => 2, '/contact' => 1, '/help_page/1' => 3, '/home' => 1, '/index' => 1 }
      end

      it 'returns the uniq view' do
        expect(subject).to eq(expected_result)
      end
    end
  end
end
