module Ringo
  class StoryCard
    def self.from_result result
      result.css('card').map do |node|
        StoryCard.new node.at_css('name').text,
                      node.at_css('number').text
      end
    end

    attr_reader :name, :number

    def initialize name, number
      @name = name
      @number = number
    end

    def to_emit
      "##{number} - #{name}"
    end
  end
end
