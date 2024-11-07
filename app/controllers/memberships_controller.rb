# app/controllers/memberships_controller.rb
class MembershipsController < ApplicationController
  before_action :authorize_user

  # Join a book club
  def create
    @book_club = BookClub.find(params[:book_club_id])
    @membership = Membership.new(user: current_user, book_club: @book_club)

    if @membership.save
      render json: { message: "Successfully joined the book club" }, status: :created
    else
      render json: { errors: @membership.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Leave a book club
  def destroy
    @book_club = BookClub.find(params[:book_club_id])
    @membership = Membership.find_by(user: current_user, book_club: @book_club)

    if @membership
      @membership.destroy
      render json: { message: "Successfully left the book club" }
    else
      render json: { message: "You are not a member of this book club" }, status: :not_found
    end
  end
end
