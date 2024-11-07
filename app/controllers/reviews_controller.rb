class ReviewsController < ApplicationController
  before_action :authorize_user
  before_action :set_book, only: [:create]

  # Create a new review for a book
  def create
    @review = @book.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      render json: { review: @review, message: "Review created successfully" }, status: :created
    else
      render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  # Find book by id
  def set_book
    @book = Book.find_by(id: params[:book_id])
    render json: { error: "Book not found" }, status: :not_found unless @book
  end

  # Strong parameters for review creation
  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
