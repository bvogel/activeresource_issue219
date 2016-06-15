class TestObject < ActiveResource::Base
  self.site = 'http://localhost:3000'
  headers['Authorization'] = "Token token=\"#{Authenticator.current_token}\""
end
