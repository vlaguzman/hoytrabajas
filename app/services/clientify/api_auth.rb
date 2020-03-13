class Clientify::ApiAuth
  USERNAME = ENV['CLIENTIFY_USERNAME']
  PASSWORD = ENV['CLIENTIFY_PASSWORD']
  CLIENTIFY_URL_API = ENV['CLIENTIFY_URL_API']

  URL_OBTAIN_TOKEN = "#{CLIENTIFY_URL_API}api-auth/obtain_token/"
  URL_LOGOUT = "#{CLIENTIFY_URL_API}api-auth/logout/"

  attr_reader :token, :username, :password

  def initialize(username=USERNAME, password=PASSWORD)
    @username = username
    @password = password
    @token = obtain_token
  end

  def obtain_token
    url = URL_OBTAIN_TOKEN
    body = "{\n    \"username\": \"#{username}\",\n    \"password\": \"#{password}\"\n}"
    response = HttpRequestManager.new(url, body).build_response(Net::HTTP::Post)
    hash = JSON.parse response.body.gsub('\:', ':')
    hash['token']
  end 
  
  def logout
    url = URL_LOGOUT
    response = HttpRequestManager.new(url).build_response(Net::HTTP::Post)
    response.code
  end

end
