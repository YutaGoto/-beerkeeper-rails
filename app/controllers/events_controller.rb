# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :authorize_request

  def index
    @events = Event.all
    render json: @events, status: :ok
  end

  def show
    @event = Event.includes(:participations, :organizer).find(params[:id])
    render json: { event: @event.as_json(include: %i[participations organizer]) }, status: :ok
  end

  def create
    @event = Event.new(event_params)
    @event.organizer = @current_user
    if @event.save
      render json: { event: @event }, status: :created
    else
      render json: { errors: @event.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    render json: { event: @event }, status: :ok
  end

  private

  def event_params
    params.permit(:name, :start_at, :end_at, :description, :budget, :max_size,
                  :location)
  end
end
