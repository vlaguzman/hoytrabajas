require "uri"
require "net/http"

class Clientify::DataCreator

  URL_CONTACTS = "https://api.clientify.net/v1/contacts/"
  STATUS = 'usuario pag'

  def create_user u

    url = URI(URL_CONTACTS)

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    clientify = Clientify::ApiAuth.new
    request = Net::HTTP::Post.new(url)
    request["Authorization"] = "Token #{clientify.token}"
    request["Content-Type"] = "application/json"
    request.body = "{\n    \"first_name\": \"#{u.name}\",\n    \"last_name\": \"#{u.last_name}\",\n    \"email\": \"#{u.email}\",\n    \"phone\": \"#{u.contact_number}\",\n    \"status\": \"#{STATUS}\",\n    \"contact_source\": \hoytrabajas.com\",\n    \"addresses\": [{\"street\":\"\", \"city\":\"\", \"state\":\"\", \"country\":\"\", \"postal_code\":\"\", \"type\":1}],\n    \"custom_fields\": [],\n    \"description\": \"Sunt vitae consequun\",\n    \"remarks\": \"Consequatur aliquid\",\n    \"summary\": \"Voluptas dolorem com\",\n    \"message\": \"Nobis aliquip quia c\",\n    \"re_property_name\": \"Hakeem Hicks\",\n    \"last_contact\": null\n}"

    response = https.request(request)
    puts response.read_body
  end 

end
