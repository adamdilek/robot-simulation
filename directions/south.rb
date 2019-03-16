module Directions
  class SOUTH < Base
    class << self
      def right
        Directions::WEST
      end

      def left
        Directions::EAST
      end

      def forward_unit
        -1
      end

      def plane_position
        'y'
      end
    end
  end

  Position.register_direction(Directions::SOUTH.identifier, Directions::SOUTH)
end
