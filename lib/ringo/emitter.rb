module Ringo
  class Emitter
    class << self
      def emit objects
        objects.each do |object|
          puts object.to_emit
        end
      end

      def emit_table table, order
        Formatador.display_table table, order
      end
    end
  end
end
