# frozen_string_literal: true

require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @token = JsonWebToken.encode(user_id: @user.id)
    @authorization = { Authorization: "Bearer #{@token}" }

    @event = events(:one)
  end

  test 'should get events' do
    get events_url, headers: @authorization
    assert_response :success
    assert JSON.parse(@response.body).size.positive?
  end

  test 'should get an event' do
    get event_url(@event), headers: @authorization
    assert_response :success
    assert_equal @event.id, JSON.parse(@response.body)['event']['id']
  end

  test 'should create an event' do
    post events_url, params: {
      name: 'Test Event',
      organizer: @user.id,
      start_at: Time.zone.now,
      end_at: 1.hour.from_now,
      description: 'This is a test event.',
      budget: '$100',
      max_size: 10,
      location: '123 Main St.'
    }, headers: @authorization
    assert_response :success
  end

  test 'should not create an event with invalid value' do
    post events_url, params: {
      name: '',
      organizer: @user.id,
      start_at: Time.zone.now,
      end_at: 1.hour.from_now,
      description: 'This is a test event.',
      budget: '$100',
      max_size: 10,
      location: '123 Main St.'
    }, headers: @authorization
    assert_response :unprocessable_entity
  end
end
