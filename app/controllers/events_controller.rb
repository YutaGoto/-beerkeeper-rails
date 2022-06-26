# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :authorize_request

  def index
    @events = Event.all
    render json: EventResource.new(@events).serialize, status: :ok
  end

  def show
    @event = Event.includes(:participations, :organizer).find(params[:id])
    render json: EventResource.new(@event).serialize, status: :ok
  end

  def create
    @event = Event.new(event_params)
    @event.organizer = @current_user
    if @event.save
      render json: EventResource.new(@event).serialize, status: :created
    else
      render json: { errors: @event.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    render json: EventResource.new(@event).serialize, status: :ok
  end

  private

  def event_params
    params.require(:event).permit(:name, :start_at, :end_at, :description, :budget, :max_size,
                                  :location)
  end
end
