class TestObjectsController < ApplicationController
  before_action :authenticate

  def index
    @test_objects = TestObject.all
    render json: @test_objects, status: 200
  end

  def show
    @test_object = TestObject.find(params[:id])
    render json: @test_object, status: 200
  end

  protected
  def authenticate
    authenticate_or_request_with_http_token do |token, _options|
      token == 'a47a8e54b11c4de5a4a351734c80a14a'
    end
  end
end
