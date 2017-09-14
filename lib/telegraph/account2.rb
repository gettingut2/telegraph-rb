module Telegraph
  class Account
    include Telegraph::Connection

    attr_reader :token

    def initialize(access_token = nil, &block)
      if block_given?
        instance_eval(&block)
        response = get('createAccount', create_acc_params)
        @token = response['result']['access_token']
      else
        raise ArgumentError, "Access token can't be nil" if access_token.nil?
        @token = access_token
        response = get_account_info
      end
    end

    def get_account_info(*fields)
      fields = ['short_name', 'auth_name', 'author_url'] if fields.empty?
      get('getAccountInfo', { access_token: token, fields: fields })
    end

    def edit_account_info
      
    end

    def short_name(account_name)
      @short_name = account_name
    end

    def author_name(auth_name)
      @auth_name = auth_name
    end

    def author_url(url)
      @author_url = url
    end

    def self.create(&block)
      new(&block)
    end

    private

    def create_acc_params
      params_array = self.instance_variables.map do |ivar|
        { ivar.to_s.gsub('@', '') => instance_variable_get(ivar) }
      end
      params_array.reduce({}, :merge)
    end
  end
end