# frozen_string_literal: true

class EventResource
  include Alba::Resource

  root_key :event, :events

  attributes :id, :name, :description, :start_at, :end_at, :location, :max_size, :budget

  one :organizer do
    attributes :id, :name
  end

  many :users do
    attributes :id, :name
  end

  many :participations do
    attributes :id, :user_id
  end

  transform_keys :lower_camel
end
