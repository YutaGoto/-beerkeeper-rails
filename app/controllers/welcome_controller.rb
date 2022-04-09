# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    render json: {
      message: 'Welcome to the API'
    }
  end
end
