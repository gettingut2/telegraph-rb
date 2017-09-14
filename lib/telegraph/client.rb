module Telegraph
  class Client
    include Telegraph::Connection

    AVAILABLE_FIELDS = ['short_name','author_name','author_url', 'auth_url', 'page_count']

    attr_reader :token

    def initialize(token)
      @token = token
    end

    def account
      @account ||= Account.new(get_account_info['result'])
    end

    def get_account_info(*fields)
      # Gets all available account information if 'fields' array not given.
      fields = AVAILABLE_FIELDS if fields.empty?
      get_without_encode('getAccountInfo', token, fields: fields)
    end

    def create_page(attrs = {})
      get_without_encode('createPage', token, attrs)
    end
  end
end