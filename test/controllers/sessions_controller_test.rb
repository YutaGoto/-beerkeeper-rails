# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'should login' do
    post users_login_url, params: {
      email: @user.email,
      password: 'password'
    }

    json_response = JSON.parse(@response.body)
    assert_response :success
    assert_equal @user.id, json_response['user']['id']
    assert json_response['token'].present?
  end

  test 'should not login' do
    post users_login_url, params: {
      email: @user.email,
      password: 'wrong_password'
    }

    assert_response :unauthorized
  end

  test 'should signup' do
    post users_signup_url, params: {
      email: 'email@exaple.com',
      password: 'password',
      password_confirmation: 'password',
      name: 'name'
    }

    json_response = JSON.parse(@response.body)
    assert_response :success
    assert json_response['token'].present?
  end

  test 'should not signup with same email' do
    post users_signup_url, params: {
      email: @user.email,
      password: 'password',
      password_confirmation: 'password',
      name: 'name'
    }

    assert_response :unauthorized
  end

  test 'should not signup with not match password' do
    post users_signup_url, params: {
      email: 'email@sample2.com',
      name: 'name',
      password: 'password',
      password_confirmation: 'wrong_password'
    }

    assert_response :unauthorized
  end
end
