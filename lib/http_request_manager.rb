require "uri"
require "net/http"

class HttpRequestManager
  attr_reader :url, :body

  def initialize(url, body=nil)
    @url = url
    @body = body
  end

  def build_response(http_method, token=nil)
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = http_method.new(url)
    request["Content-Type"] = "application/json"
    request["Authorization"] = "Token #{token}" if token.present?
    request.body = body if body.present?
    https.request(request)
  end
end
