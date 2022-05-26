# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @token = JsonWebToken.encode(user_id: @user.id)
    @authorization = { Authorization: "Bearer #{@token}" }
  end

  test 'should get me' do
    get users_profile_url, headers: @authorization
    assert_response :success
    assert_equal @user.id, JSON.parse(@response.body)['user']['id']
  end

  test 'not allow to get me without token' do
    get users_profile_url
    assert_response :unauthorized
  end
end
