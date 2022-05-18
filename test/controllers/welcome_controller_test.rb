# frozen_string_literal: true

require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test 'Welcome' do
    get root_url
    json_response = JSON.parse(@response.body)
    assert_response :success
    assert_equal 'Welcome to the API', json_response['message']
  end
end
