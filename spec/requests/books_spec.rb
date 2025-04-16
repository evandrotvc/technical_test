require 'rails_helper'

RSpec.describe 'Books' do
  let(:body) { response.parsed_body }
  let!(:book)  { create(:book) }
  let(:headers) {}
  let(:params) do
    {
      book: {
        email: 'maria@gmail.com'
      }
    }
  end

  describe 'POST /books/:id/reserved' do
    context 'when the book is avaliable' do
      it 'must to change status the book to reserved' do
        post(reserve_book_path(book.id), as: :json, params:)

        expect(body['message']).to eq("The book #{book.title} is reserved for you!")
      end

      it 'must return ok on status' do
        post(reserve_book_path(book.id), as: :json, params:)

        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the book is already reserved' do
      let!(:book) { create(:book, status: 'reserved') }

      it 'must return unprocessable_entity status' do
        post(reserve_book_path(book.id), as: :json, params:)

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'must return a message indicating the book is reserved' do
        post(reserve_book_path(book.id), as: :json, params:)

        expect(body['message']).to eq("The book #{book.title} is already reserved!")
      end
    end

    context 'when the book is already checked_out' do
      let!(:book) { create(:book, status: 'checked_out') }

      it 'must return unprocessable_entity status' do
        post(reserve_book_path(book.id), as: :json, params:)

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'must return a message indicating the book is reserved' do
        post(reserve_book_path(book.id), as: :json, params:)

        expect(body['message']).to eq("The book #{book.title} is already reserved!")
      end
    end
  end

  describe 'GET /books/' do
    let!(:books) { create_list(:book, 3) }
    before { get books_path, as: :json }

    it 'returns a successful response' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders a JSON array of books' do
      expect(response.content_type).to eq('application/json; charset=utf-8')
      parsed_body = JSON.parse(response.body)

      expect(parsed_body.count).to eq(4)
    end
  end
end
