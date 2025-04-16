class BooksController < ApplicationController
  before_action :set_book

  def reserve
    byebug
    return book_is_reserved if book.reserved?

    if book.update_email_and_reserved
      render json: { message: "The book #{@book.title} is reserved for you!", status: :ok }
    else
      render json: { message: "It happens some error. Wait for moment, please", status: :error }
    end
  end

  private

  def update_email_and_reserved
    @book.update!(email: book_params[:email])
    book.reserved!
  end

  def book_is_reserved
    render json: { message: "The book #{@book.title} is already reserved!", status: :unprocessable_entity }
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :email)
  end
end