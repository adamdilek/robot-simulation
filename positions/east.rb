module Positions
  class EAST < Base
    class << self
      def right
        Positions::SOUTH
      end

      def left
        Positions::NORTH
      end

      def forward
        1
      end

      def plane_position
        'x'
      end
    end
  end

  Position.register_position(Positions::EAST.identifier, Positions::EAST)
end