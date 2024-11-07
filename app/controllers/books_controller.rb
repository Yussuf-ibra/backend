class BooksController < ApplicationController
  before_action :authorize_user, only: [:create, :destroy]
  before_action :set_book, only: [:show, :destroy]

  # Index - List all books
  def index
    @books = Book.all
    render json: @books, status: :ok
  end

  # Show - Show details of a specific book
  def show
    render json: @book, status: :ok
  end

  # Create - Add a new book (admin only)
  def create
    @book = Book.new(book_params)
    if @book.save
      render json: { book: @book, message: "Book created successfully" }, status: :created
    else
      render json: { errors: @book.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Destroy - Delete a book (admin only)
  def destroy
    if @book.destroy
      render json: { message: "Book deleted successfully" }, status: :ok
    else
      render json: { error: "Failed to delete book" }, status: :unprocessable_entity
    end
  end

  private

  # Find book by id
  def set_book
    @book = Book.find_by(id: params[:id])
    unless @book
      render json: { error: "Book not found" }, status: :not_found
    end
  end

  # Strong parameters for book creation
  def book_params
    params.require(:book).permit(:title, :author, :description, :image_url)
  end
end
