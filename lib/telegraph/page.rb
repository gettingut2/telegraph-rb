module Telegraph
  class Page
    attr_reader :path, :url, :title, :description, :views, :can_edit, :author_name, :author_url

    def initialize(attrs = {})
      @path = attrs['path']
      @url = attrs['url']
      @title = attrs['title']
      @description = attrs['description']
      @views = attrs['views']
      @can_edit = attrs['can_edit']
      @author_name = attrs['author_name']
      @author_url = attrs['author_url']
    end
  end
end