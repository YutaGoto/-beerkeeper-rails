# frozen_string_literal: true

class SessionsController < ApplicationController
  def login
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.zone.now + 24.hours.to_i
      render json: {
        token:,
        exp: time.strftime('%Y-%m-%d %H:%M'),
        user: @user
      }, status: :ok
    else
      render json: { error: 'UnAuthorized' }, status: :unauthorized
    end
  end

  def signup
    @user = User.new(user_params)
    if @user.save
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.zone.now + 24.hours.to_i
      render status: :ok
    else
      render json: { error: 'UnAuthorized' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :name)
  end
end
