module NodeHelper
  refine Nokogiri::XML::Element do
    def to_node
      children = self.children.map do |child|
        if child.name == 'text'
          child.text
        else
          children2 = child.children.map do |child2|
            if child2.name == 'text'
              child2.text
            else
              child2.to_node
            end
          end
          {"tag": child.name, "children": children2}
        end
      end
      {"tag": self.name, "children": children}
    end
  end
end