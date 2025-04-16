require 'rails_helper'

RSpec.describe Book do
  let(:book) { build(:book) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
  end

  describe '#valid' do
    it 'must be valid' do
      expect(book.valid?).to be(true)
    end
  end

  describe 'change status' do
    let(:book) { create(:book) }

    it 'must change status to reserved' do
      book.reserved!

      expect(book.reload.status).to eq('reserved')
    end
  end

  describe '#is_unavaliable?' do
    let(:book) { create(:book) }

    context 'when status is reserved' do
      before { book.reserved! }

      it 'returns true' do
        expect(book).to be_is_unavaliable
      end
    end

    context 'when status is checked_out' do
      before { book.checked_out! }

      it 'returns true' do
        expect(book).to be_is_unavaliable
      end
    end

    context 'when status is avaliable' do
      it 'returns false' do
        expect(book).not_to be_is_unavaliable
      end
    end
  end
end
