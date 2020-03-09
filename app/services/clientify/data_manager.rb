require "uri"
require "net/http"

class Clientify::DataManager

  URL_CONTACTS = "https://api.clientify.net/v1/contacts/"

  def create_contact user, user_type
    url = URI(URL_CONTACTS)
    body = "{\n    \"email\": \"#{user.email}\",
             \n    \"tags\": [\"#{user_type}\", \"htweb\"]
            }"

    response = build_response(url, body, Net::HTTP::Post)
    user.clientify_contact_id = convert_response_and_give(response, 'id')
    user.save
    response.read_body
  end 

  def update_contact user
    url = URI("#{URL_CONTACTS}#{user.clientify_contact_id}/")
    body = "{\n    \"first_name\": \"#{user.name}\",
             \n    \"last_name\": \"#{user.last_name}\",
             \n    \"phone\": \"#{user.contact_number}\"
            }"

    response = build_response(url, body, Net::HTTP::Put)
    response.read_body
  end

  def build_response(url, body=nil, http_method)
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    clientify = Clientify::ApiAuth.new
    token = cientify.token

    request = http_method.new(url)
    request["Content-Type"] = "application/json"
    request["Authorization"] = "Token #{token}" if token.present?
    request.body = body if body.present?
    https.request(request)
  end

  private 

  def convert_response_and_give response, data
    hash = JSON.parse response.body.gsub('\:', ':')
    hash[data]
  end

end
