# frozen_string_literal: true

user = User.create(
  name: 'John Doe',
  email: 'test@example.com',
  password: 'password',
  password_confirmation: 'password'
)

Event.create(
  name: 'Test Event',
  organizer: user,
  start_at: Time.zone.now,
  end_at: 1.hour.from_now,
  description: 'This is a test event.',
  budget: '$100',
  max_size: 10,
  location: '123 Main St.'
)
