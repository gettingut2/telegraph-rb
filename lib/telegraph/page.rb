module Telegraph
  class Page
    attr_reader :path, :url, :title, :description, :views, :can_edit, :author_name, :author_url

    def initialize(attrs = {})
      attrs.each { |k, v| instance_variable_set("@#{k}", v) }
    end
  end
end