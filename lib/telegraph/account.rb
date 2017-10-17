module Telegraph
  class Account
    attr_reader :token, :short_name, :author_name, :auth_url, :author_url

    def initialize(attrs)
      p attrs
      define_variables(attrs)
    end

    private

    def define_variables(account_attrs)
      account_attrs.each do |key, value|
        instance_variable_set("@#{key.to_sym}", value)
      end
    end

  end
end