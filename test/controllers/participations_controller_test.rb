# frozen_string_literal: true

require 'test_helper'

class ParticipationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @token = JsonWebToken.encode(user_id: @user.id)
    @authorization = { Authorization: "Bearer #{@token}" }

    @event = events(:two)
    @participation = participations(:one)
  end

  test 'should create participation' do
    post participations_url, params: {
      event_id: @event.id
    }, headers: @authorization

    assert_response :success
  end

  test 'should delete participation' do
    delete participation_url(@participation), headers: @authorization

    assert_response :success
  end
end
