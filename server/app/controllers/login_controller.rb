class LoginController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def login
    @token = 'a47a8e54b11c4de5a4a351734c80a14a'
    render json: { token: @token }, status: 200
  end
end
