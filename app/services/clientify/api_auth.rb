class Clientify::ApiAuth
  URL_OBTAIN_TOKEN = "https://api.clientify.net/v1/api-auth/obtain_token/"
  USERNAME = 'vladimir@hoytrabajas.com'
  PASSWORD = 'unicornio2020'

  def obtain_token
    #require "uri"
    #require "net/http"

    url = URI(URL_OBTAIN_TOKEN)

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Content-Type"] = "application/json"
    request.body = "{\n    \"username\": \"#{USERNAME}\",\n    \"password\": \"#{PASSWORD}\"\n}"

    response = http.request(request)
    puts response.read_body
  end 
end
