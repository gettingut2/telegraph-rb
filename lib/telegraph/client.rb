module Telegraph
  class Client
    include Telegraph::Connection

    AVAILABLE_FIELDS = ['short_name','author_name','author_url', 'auth_url', 'page_count']

    attr_reader :token

    def initialize(token)
      @token = token
    end

    def account
      @account ||= Account.new(get_account_info)
    end

    def get_account_info(*fields)
      # Gets all available account information if 'fields' array not given.
      fields = AVAILABLE_FIELDS if fields.empty?
      get('getAccountInfo', {fields: fields.to_s}, token: token)['result']
    end

    def create_page(attrs = {})
      response = get('createPage', attrs, token: token)
      page_attrs = response
      Page.new(page_attrs)
    end
  end
end