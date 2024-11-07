class BookClubsController < ApplicationController
  before_action :authorize_user, only: [:create]
  before_action :set_book_club, only: [:show]

  # Index - List all book clubs
  def index
    @book_clubs = BookClub.all
    render json: @book_clubs, status: :ok
  end

  # Show - Show details of a specific book club
  def show
    render json: @book_club, status: :ok
  end

  # Create - Create a new book club (admin only)
  def create
    @book_club = BookClub.new(book_club_params)
    if @book_club.save
      render json: { book_club: @book_club, message: "Book club created successfully" }, status: :created
    else
      render json: { errors: @book_club.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  # Find book club by id
  def set_book_club
    @book_club = BookClub.find_by(id: params[:id])
    unless @book_club
      render json: { error: "Book club not found" }, status: :not_found
    end
  end

  # Strong parameters for book club creation
  def book_club_params
    params.require(:book_club).permit(:name, :description)
  end
end
