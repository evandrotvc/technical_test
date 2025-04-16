class BooksController < ApplicationController
  before_action :set_book, only: [:reserve, :show]

  def index
    # Eager load authors for better performance, and you avoid query n+1, with book.author.name
    @books = Book.page(params[:page]).per(30).includes(:author)
    render :index
  end

  def show
    render :show
  end

  def reserve
    if @book.is_unavaliable?
      book_is_reserved
    elsif @book.update_email_and_reserved(email: book_params[:email])
      render json: { message: "The book #{@book.title} is reserved for you!",
                     status: :ok }
    else
      render json: { message: 'It happens some error. Wait for moment, please',
                     status: :error }
    end
  end

  private

  def book_is_reserved
    render :errors, status: :unprocessable_entity
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :email)
  end
end
