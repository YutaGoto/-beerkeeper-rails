# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :organizing_events, class_name: 'Event', foreign_key: 'organizer_id', dependent: :destroy,
                               inverse_of: :organizer
  has_many :participations, dependent: :destroy
  has_many :events, through: :participations

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 8 }

  def self.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost: cost)
  end
end
