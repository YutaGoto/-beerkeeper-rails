# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :organizing_events, class_name: 'Event', foreign_key: 'organizer_id', dependent: :destroy,
                               inverse_of: :organizer
  has_many :participations, dependent: :destroy
  has_many :events, through: :participations

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 8 }
end
