module Ringo
  class StoryCard
    def self.from_result result
      result.css('card').map do |node|
        properties = node.css('property').map do |property_node|
          Property.from_result property_node
        end

        StoryCard.new node.at_css('name').text,
                      node.at_css('number').text,
                      properties
      end
    end

    attr_reader :name, :number, :properties

    def initialize name, number, properties
      @name = name
      @number = number
      @properties = properties
    end

    def status
      properties.detect { |property| property.name == 'Status' }.value
    end

    def to_emit
      "##{number} - #{status} - #{name}"
    end
  end

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
