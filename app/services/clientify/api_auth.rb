require "uri"
require "net/http"

class Clientify::ApiAuth
  URL_OBTAIN_TOKEN = "https://api.clientify.net/v1/api-auth/obtain_token/"
  URL_LOGOUT = "https://api.clientify.net/v1/api-auth/logout/"
  USERNAME = 'vladimir@hoytrabajas.com'
  PASSWORD = 'unicornio2020'

  attr_reader :token

  def initialize
    @token = obtain_token
  end

  def obtain_token
    body = "{\n    \"username\": \"#{USERNAME}\",\n    \"password\": \"#{PASSWORD}\"\n}"
    response = build_response(URI(URL_OBTAIN_TOKEN), body)
    hash = JSON.parse response.body.gsub('\:', ':')
    hash['token']
  end 
  
  def logout
    response = build_response URI(URL_LOGOUT)
    response.code
  end

  def build_response(url, body=nil)
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = "application/json"
    request["Authorization"] = "Token #{token}" if token.present?
    request.body = body if body.present?
    https.request(request)
  end

end
