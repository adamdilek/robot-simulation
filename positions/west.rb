module Positions
  class WEST < Base
    class << self
      def right
        Positions::NORTH
      end

      def left
        Positions::SOUTH
      end

      def forward
        -1
      end

      def plane_position
        'x'
      end
    end
  end

  Position.register_position(Positions::WEST.identifier, Positions::WEST)
end