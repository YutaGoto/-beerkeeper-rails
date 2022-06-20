# frozen_string_literal: true

class EventResource
  Alba::Resource

  attributes :name, :description, :start_at, :end_at, :location, :max_size, :budget, :users, :organizer
end
