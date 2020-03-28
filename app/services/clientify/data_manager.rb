class Clientify::DataManager
  URL_CONTACTS = "#{Clientify::ApiAuth::CLIENTIFY_URL_API}contacts/"

  CONTACT_CANDIDATE_TAG = ENV['CLIENTIFY_CANDIDATE_TAG']
  CONTACT_COMPANY_TAG   = ENV['CLIENTIFY_COMPANY_TAG']
  CONTACT_SOURCE        = ENV['CLIENTIFY_SOURCE']

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
             \n    \"last_name\": \"#{last_name_or_nil user}\",
             \n    \"phone\": \"#{phone_number user}\"
            }"

    response = HttpRequestManager.new(url, body).build_response(Net::HTTP::Put, token)
    response.read_body
  end
  
  def get_contacts source=CONTACT_SOURCE 
    url = "#{URL_CONTACTS}?contact_source=#{source}"

    response = HttpRequestManager.new(url).build_response(Net::HTTP::Get, token)
    response.read_body
  end

  def get_contact_tags id_contact 
    url = "#{URL_CONTACTS}#{id_contact}/tags/"

    response = HttpRequestManager.new(url).build_response(Net::HTTP::Get, token)
    response.read_body
  end

  private 
  
  def last_name_or_nil resource 
    (resource.is_a? User)? resource.last_name : nil
  end

  def phone_number resource
    (resource.is_a? User)? resource.contact_number : resource.contact_cellphone
  end

  def convert_response_and_give response, data
    hash = JSON.parse response.body.gsub('\:', ':')
    hash[data]
  end
  
  def token
    @token
  end

end
