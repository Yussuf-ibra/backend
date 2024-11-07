class UsersController < ApplicationController
  before_action :authorize_user, only: [:profile]

  # Signup
  def create
    user = User.new(user_params)
    if user.save
      render json: { user: user, message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Login
  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      token = encode_token(user_id: user.id)
      render json: { user: user, jwt: token, message: "Login successful" }
    else
      render json: { errors: ["Invalid email or password"] }, status: :unauthorized
    end
  end

  # Profile
  def profile
    render json: { user: current_user }
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end
end
