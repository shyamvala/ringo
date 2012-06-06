module Ringo
  class Emitter
    def self.emit objects
      objects.each do |object|
        puts object.to_emit
      end
    end
  end
end
