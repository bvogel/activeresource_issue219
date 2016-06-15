# encoding: utf-8
# frozen_string_literal: true
class Authenticator
  def self.current_token
    if CONFIG[:token].blank?
      url =  'http://localhost:3000/login/login'
      uri = URI.parse(url)
      result = ''
      Net::HTTP.start(uri.host, uri.port) do |http|
        result = handle_request(http, uri)
      end
      CONFIG[:token] = result['token']
    end
    CONFIG[:token]
  end

  class << self
    private

    def handle_request(http, uri, params = {}.to_json)
      request = Net::HTTP::Post.new(uri.path, 'Content-Type' => 'application/json')
      request.body = params
      response = http.request request

      case response
        when Net::HTTPSuccess then
          JSON.parse(response.body)
        when Net::HTTPUnauthorized then
          raise 'Unauthorized'
        else
          raise
      end
    end
  end
end
