# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authorize_request

  def profile
    render json: { user: @current_user.as_json(include: %i[organizing_events events]) }, status: :ok
  end
end
