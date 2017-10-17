module Telegraph
  module Connection

    BASE_URL = 'https://api.telegra.ph'

    def get(method, params, token: nil)
      response = get_response(method, params, token)
      JSON.parse(response.body)
    end

    def connection
      @connection ||= Faraday.new(url: BASE_URL) do |faraday|
        faraday.request :url_encoded
        faraday.adapter  Faraday.default_adapter
      end
    end

    private

    def get_response(method, params, token)
      url = "#{BASE_URL}/#{method}"
      url = url + "?access_token=#{token}" if token
      connection.get do |req|
        req.params.merge!(params)
        req.url(url)
      end
    end
  end
end