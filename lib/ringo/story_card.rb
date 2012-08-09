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

    def self.from_card card_result
      card_node = card_result.css('card')
      properties = card_node.css('property').map do |property_node|
        Property.from_result property_node
      end

      name = card_node.at_css('name').text if card_node.at_css('name')
      number = card_node.at_css('number').text if card_node.at_css('number')

      StoryCard.new name, number, properties
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

    def to_emit(max=1000)
      "##{number} - #{name}"[0..max]
    end

    def to_hash
      {
        name: name[0..30],
        number: number,
        status: status
      }
    end
  end
end
