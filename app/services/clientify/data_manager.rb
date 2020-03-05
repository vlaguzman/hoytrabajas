require "uri"
require "net/http"

class Clientify::DataManager

  URL_CONTACTS = "https://api.clientify.net/v1/contacts/"

  def create_contact user, user_type
    url = URI(URL_CONTACTS)
    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true
    clientify = Clientify::ApiAuth.new

    request = Net::HTTP::Post.new(url)
    request["Authorization"] = "Token #{clientify.obtain_token}"
    request["Content-Type"] = "application/json"
    request.body = "{\n    \"email\": \"#{user.email}\",
                     \n    \"tags\": [\"#{user_type}\", \"htweb\"]
                     }"

    response = https.request(request)
    user.clientify_contact_id = convert_response_and_give(response, 'id')
    user.save
    puts response.read_body
  end 

  def update_contact user
    url = URI("#{URL_CONTACTS}#{user.clientify_contact_id}/")
    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true
    clientify = Clientify::ApiAuth.new
 
    request = Net::HTTP::Put.new(url)
    request["Authorization"] = "Token #{clientify.obtain_token}"
    request["Content-Type"] = "application/json"
    request.body = "{\n    \"first_name\": \"#{user.name}\",
                     \n    \"last_name\": \"#{user.last_name}\",
                     \n    \"phone\": \"#{user.contact_number}\"
                     }"

    response = https.request(request)
    puts response.read_body
  end

  private 

  def convert_response_and_give response, data
    hash = JSON.parse response.body.gsub('\:', ':')
    hash[data]
  end

end
