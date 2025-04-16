require 'rails_helper'

RSpec.describe BooksController, type: :request do
  let(:body) { response.parsed_body }
  let!(:book)  { create(:book) }
  let(:params) do
    {
      book: {
        email: 'maria@gmail.com'
      }
    }
  end

  describe 'POST book/:id/reserved' do
    context 'when the book is avaliable' do

      it 'must to change status the book to reserved' do
        byebug
        post reserve_books_path(book.id), as: :json, params: params

        expect(body)
      end
    end
  end
end