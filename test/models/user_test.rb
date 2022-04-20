# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test 'should not save user without all' do
    user = User.new
    assert user.invalid?
  end

  test 'should valid user' do
    assert @user.invalid?
  end

  test 'should not save user without email' do
    @user.email = nil
    assert @user.invalid?
    assert_includes @user.errors.full_messages, "Email can't be blank"
  end

  test 'should not save user same email' do
    dup_user = @user.dup
    dup_user.email = @user.email
    assert dup_user.invalid?
    assert dup_user.errors[:email].any?
  end
end
