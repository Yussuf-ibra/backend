# app/controllers/application_controller.rb
class ApplicationController < ActionController::API
  def encode_token(payload)
    JWT.encode(payload, 'your_secret_key')  # Secret key for JWT encoding
  end

  def decode_token
    auth_header = request.headers['Authorization']
    if auth_header
      token = auth_header.split(' ')[1]  # Get token from "Bearer <token>"
      begin
        JWT.decode(token, 'your_secret_key', true, algorithm: 'HS256')  # Decode token
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def authorize_user
    decoded_token = decode_token
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @current_user = User.find_by(id: user_id)
    else
      render json: { message: 'Please log in' }, status: :unauthorized
    end
  end

  def current_user
    @current_user
  end
end
