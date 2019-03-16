module Directions
  class NORTH < Base
    class << self
      def right
        Directions::EAST
      end

      def left
        Directions::WEST
      end

      def forward_unit
        1
      end

      def plane_position
        'y'
      end
    end
  end

  Position.register_direction(Directions::NORTH.identifier, Directions::NORTH)
end
