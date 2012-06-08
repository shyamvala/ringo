module Ringo
  class Property
    def self.from_result node
      Property.new node.at_css('name').text,
                   node.at_css('value').text
    end

    attr_reader :name, :value

    def initialize name, value
      @name = name
      @value = value
    end
  end
end
