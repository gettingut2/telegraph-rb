module Telegraph
  class NodeElement
    attr_reader :tag, :attrs, :children

    AVAILABLE_TAGS = %w{
      a
      aside
      b
      blockquote
      br
      code
      em
      figcaption
      figure
      h3
      h4
      hr
      i
      iframe
      img
      li
      ol
      p
      pre
      s
      strong
      u
      ul
      video
    }

    AVAILABLE_ATTRIBUTES = %w{ href src }

    def initialize(tag, attrs = {}, children = [])
      check_tag(tag)
      @tag = tag
      @attrs = attrs
      @children = children
    end

    private

    def check_tag(tag)
      unless AVAILABLE_TAGS.include?(tag)
        raise ArgumentError, "Wrong tag: '#{tag}'. Check available tags."
      end
    end
  end
end