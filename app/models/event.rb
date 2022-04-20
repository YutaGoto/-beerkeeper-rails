# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :organizer, class_name: 'User'
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations

  validates :name, presence: true
  validates :description, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :location, presence: true
  validates :max_size, presence: true, numericality: { only_integer: true, greater_than: 1 }
  validates :budget, presence: true
end
