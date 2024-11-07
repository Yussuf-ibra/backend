# app/controllers/notifications_controller.rb
class NotificationsController < ApplicationController
  before_action :authorize_user
  
  # Index - List all notifications for the current user
  def index
    @notifications = current_user.notifications.order(created_at: :desc)
    render json: @notifications
  end

  # Show - Show a specific notification (mark as read)
  def show
    @notification = current_user.notifications.find(params[:id])
    @notification.update(read: true)
    render json: @notification
  end

  # Create - Create a new notification (typically for an event such as a new discussion or comment)
  def create
    @notification = Notification.new(notification_params)
    @notification.user = current_user

    if @notification.save
      render json: { notification: @notification, message: "Notification created successfully" }, status: :created
    else
      render json: { errors: @notification.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Destroy - Delete a notification
  def destroy
    @notification = current_user.notifications.find(params[:id])
    @notification.destroy
    render json: { message: "Notification deleted successfully" }
  end

  private

  def notification_params
    params.require(:notification).permit(:message, :read)
  end
end
