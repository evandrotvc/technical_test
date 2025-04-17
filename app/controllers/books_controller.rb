class BooksController < ApplicationController
  before_action :set_book, only: %i[reserve show]

  PER_PAGE = 10

  # question 2 explanation
  # 1)Database Indexing: We've added indexes to relevant columns in the authors
  # and books tables (like author_id, authors.name, authors.age).
  # This allows the database to retrieve
  # data for filtering and sorting operations much faster

  # 2)Eager load authors (using includes(:author)) for better performance,
  # and you avoid query n+1, when you do example -> book.author.name

  # 3) Pagination: We've introduced pagination using will_paginate.
  # Instead of fetching all books at once,
  # the results are now returned in smaller, manageable pages

  def index
    @books = Book.paginate(page: params[:page], per_page: PER_PAGE).includes(:author)
    render :index
  end

  def show
    render :show
  end

  def reserve
    if @book.unavaliable?
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
