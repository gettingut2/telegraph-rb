module Telegraph
  module Connection
    def get(method, params, token: nil)
      # Makes GET request with encoded query params.
      if token
        uri = URI(BASE_URL + method + "?access_token=#{token}")
      else
        uri = URI(BASE_URL + method)
      end
      uri.query = URI.encode_www_form(params)
      get_json_response(uri)
    end

    def get_without_encode(method, token, params)
      # Makes custom query GET request without params encoding.
      uri = URI(BASE_URL + method)
      get_json_response(uri, token, params)
    end

    private

    def build_custom_query(token, params)
      # Builds custom query for #get_without_encode
      additional_params = params.map do |k, v|
        if k.to_s == 'content'
          v = URI.encode(v.to_json)
        end
        "#{k}=#{v}"
      end
      "?access_token=#{token}&#{additional_params.join('&')}"
    end

    def get_json_response(uri, token, params)
      additional_params = params.map do |k, v|
        if k.to_s == 'content'
          v = v.to_json
        end
        "#{k}=#{v}"
      end
      params.delete(:content)
      papa = additional_params[3].gsub('content=', '')
      hsh = {access_token: token, content: papa}
      response = Net::HTTP.post_form(uri, hsh.merge(params))
      JSON.parse(response.body)
    end
  end
end