require 'rails_helper'

RSpec.describe Book do
  let(:book) { build(:book) }

  describe '#valid' do
    it 'must be valid' do
      expect(book.valid?).to eq(true)
    end
  end

  describe 'change status' do
    let(:book) { create(:book) }

    it 'must change status to reserved' do
      book.reserved!

      expect(book.reload.status).to eq('reserved')
    end
  end
end