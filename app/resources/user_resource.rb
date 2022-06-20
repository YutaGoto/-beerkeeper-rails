# frozen_string_literal: true

class UserResource
  include Alba::Resource

  attributes :name, :email, :organizing_events, :events
end
