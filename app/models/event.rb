# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :organizer, class_name: 'User'
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations
end
