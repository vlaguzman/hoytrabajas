require "uri"
require "net/http"

class Clientify::ApiAuth
  URL_OBTAIN_TOKEN = "https://api.clientify.net/v1/api-auth/obtain_token/"
  URL_LOGOUT = "https://api.clientify.net/v1/api-auth/logout/"
  USERNAME = 'vladimir@hoytrabajas.com'
  PASSWORD = 'unicornio2020'

  attr_reader :token

  def obtain_token
    url = URI(URL_OBTAIN_TOKEN)

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = "application/json"
    request.body = "{\n    \"username\": \"#{USERNAME}\",\n    \"password\": \"#{PASSWORD}\"\n}"

    response = https.request(request)
    hash = JSON.parse response.body.gsub('\:', ':')
    @token = hash['token']
  end 
  
  def logout
    url = URI(URL_LOGOUT)

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Authorization"] = "Token #{token}"
    request["Content-Type"] = "application/json"

    response = https.request(request)
    response.code
  end
end
