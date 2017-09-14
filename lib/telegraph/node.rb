module Telegraph
  class NodeElement
    attr_reader :tag, :attrs, :children

    def initialize(tag, attrs = {}, children = [])
      @tag = tag
      @attrs = attrs
      @children = children
    end
  end
end