require "uri"
require "net/http"

class Clientify::DataCreator

  URL_CONTACTS = "https://api.clientify.net/v1/contacts/"
  URL_EDIT_CONTACT = "https://api.clientify.net/v1/contacts/7005475/"
  STATUS = 'usuario pag'

  def create_candidate u

    url = URI(URL_CONTACTS)

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    clientify = Clientify::ApiAuth.new
    request = Net::HTTP::Post.new(url)
    request["Authorization"] = "Token #{clientify.obtain_token}"
    request["Content-Type"] = "application/json"
    request.body = "{\n    \"email\": \"#{u.email}\",
                     \n    \"tags\": [\"candidate\", \"htweb\"]
                     }"

    response = https.request(request)
    puts response.read_body
  end 

  def create_employer u

    url = URI(URL_CONTACTS)

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    clientify = Clientify::ApiAuth.new
    request = Net::HTTP::Post.new(url)
    request["Authorization"] = "Token #{clientify.obtain_token}"
    request["Content-Type"] = "application/json"
    request.body = "{\n    \"first_name\": \"#{u.name}\",
                     \n    \"last_name\": \"#{u.last_name}\",
                     \n    \"email\": \"#{u.email}\",
                     \n    \"phone\": \"#{u.contact_number}\",
                     \n    \"tags\": [\"employer\", \"htweb\"],
                     \n    \"status\": \"#{STATUS}\"}"

    response = https.request(request)
    puts response.read_body
  end

  def update_user u
    url = URI(URL_EDIT_CONTACT)

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    clientify = Clientify::ApiAuth.new
    request = Net::HTTP::Put.new(url)
    request["Authorization"] = "Token #{clientify.obtain_token}"
    request["Content-Type"] = "application/json"
    request.body = "{\n    \"first_name\": \"#{u.name}\",
                     \n    \"last_name\": \"#{u.last_name}\",
                     \n    \"phone\": \"#{u.contact_number}\"
                     }"

    response = https.request(request)
    puts response.read_body
  end

end
