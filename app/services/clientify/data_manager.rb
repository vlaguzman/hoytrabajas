class Clientify::DataManager
  URL_CONTACTS = "https://api.clientify.net/v1/contacts/"

  def initialize(token=nil)
    @token = token || Clientify::ApiAuth.new().token
  end
  
  def create_contact user, user_type
    url = URL_CONTACTS
    body = "{\n    \"email\": \"#{user.email}\",
             \n    \"tags\": [\"#{user_type}\", \"htweb\"]
            }"

    response = HttpRequestManager.new(url, body).build_response(Net::HTTP::Post, token)
    user.clientify_contact_id = convert_response_and_give(response, 'id')
    user.save
    response.read_body
  end 

  def update_contact user
    url = "#{URL_CONTACTS}#{user.clientify_contact_id}/"
    body = "{\n    \"first_name\": \"#{user.name}\",
             \n    \"last_name\": \"#{user.last_name}\",
             \n    \"phone\": \"#{user.contact_number}\"
            }"

    response = HttpRequestManager.new(url, body).build_response(Net::HTTP::Put, token)
    response.read_body
  end

  private 

  def convert_response_and_give response, data
    hash = JSON.parse response.body.gsub('\:', ':')
    hash[data]
  end
  
  def token
    @token
  end

end
