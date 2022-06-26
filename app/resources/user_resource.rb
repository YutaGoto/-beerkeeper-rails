# frozen_string_literal: true

class UserResource
  include Alba::Resource

  root_key :user, :users

  attributes :name, :email

  many :organizing_events, resource: EventResource
  many :events, resource: EventResource

  transform_keys :lower_camel
end
