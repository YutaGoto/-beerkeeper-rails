# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authorize_request

  def profile
    render json: UserResource.new(@current_user).serialize, status: :ok
  end
end
