module Telegraph
  class Account
    attr_reader :access_token, :short_name, :author_name, :auth_url, :author_url

    def initialize(attrs)
      @access_token = attrs['access_token'] if attrs['access_token']
      @short_name = attrs['short_name']
      @author_name = attrs['author_name']
      @auth_url = attrs['auth_url']
      @author_url = attrs['author_url']
      @page_count = attrs['page_count']
    end
  end
end