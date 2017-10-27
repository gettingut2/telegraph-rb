module Telegraph
  class Client
    BASE_URL = 'https://api.telegra.ph'

    def get(method, params)
      response = request(method, params)
      resp_hash = JSON.parse(response.body)
      check_errors(resp_hash)
      resp_hash['result']
    end

    attr_accessor :token

    def initialize(token)
      @token = token
    end

    def create_account(config, attrs = {})
      acc_info = get('createAccount', attrs)
      config.key = acc_info['access_token']
      self.token = acc_info['access_token']
      self
    end

    def account
      @account ||= Account.new(get_account_info)
    end

    def get_account_info(*fields)
      # Gets all available account information if 'fields' array not given.
      available_fields = %w(short_name author_name author_url auth_url page_count)
      fields = available_fields if fields.empty?
      get('getAccountInfo', fields: fields.to_s)
    end

    def edit_account_info(attrs = {})
      response = get('editAccountInfo', attrs)
      update_info(account, response)
    end

    def create_page(attrs = {})
      response = get('createPage', attrs)
      Page.new(response)
    end

    def get_page(attrs = {})
      response = get('getPage', attrs)
      Page.new(response)
    end

    def get_page_list(attrs = {})
      response = get('getPageList', attrs)
      PageList.new(response)
    end

    private

    def connection
      @connection ||= Faraday.new(url: BASE_URL) do |faraday|
        faraday.request :url_encoded
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end
    end

    def request(method, params)
      url = "#{BASE_URL}/#{method}"
      url = url + "?access_token=#{token}" if token
      connection.get do |req|
        req.params.merge!(params)
        req.url(url)
      end
    end

    def check_errors(response)
      raise ArgumentError, response['error'] if response['ok'] == false
    end

    def update_info(obj, attrs)
      attrs.each do |k,v|
        obj.instance_variable_set("@#{k}", v)
      end
      obj
    end
  end
end