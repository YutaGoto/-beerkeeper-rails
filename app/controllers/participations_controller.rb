# frozen_string_literal: true

class ParticipationsController < ApplicationController
  before_action :authorize_request

  def create
    @event = Event.find(params[:event_id])
    @participation = Participation.new(user: @current_user, event: @event)
    if @participation.save
      render json: { participation: @participation }, status: :created
    else
      render json: { errors: @participation.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @participation = Participation.find_by(user: @current_user, id: params[:id])
    @participation.destroy
    head :no_content
  end
end
