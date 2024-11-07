# app/controllers/discussions_controller.rb
class DiscussionsController < ApplicationController
  before_action :authorize_user

  # Index - List all discussions for a book club
  def index
    @book_club = BookClub.find(params[:book_club_id])
    @discussions = @book_club.discussions
    render json: @discussions
  end

  # Create - Create a new discussion
  def create
    @book_club = BookClub.find(params[:book_club_id])
    @discussion = @book_club.discussions.new(discussion_params)
    @discussion.user = current_user

    if @discussion.save
      # Create a notification for all members (except the user who created the discussion)
      @book_club.memberships.where.not(user_id: current_user.id).each do |membership|
        Notification.create(user: membership.user, message: "New discussion posted in #{@book_club.name}: #{@discussion.content}")
      end

      render json: { discussion: @discussion, message: "Discussion created successfully" }, status: :created
    else
      render json: { errors: @discussion.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def discussion_params
    params.require(:discussion).permit(:content)
  end
end
