module Directions
  class WEST < Base
    class << self
      def right
        Directions::NORTH
      end

      def left
        Directions::SOUTH
      end

      def forward_unit
        -1
      end

      def plane_position
        'x'
      end
    end
  end

  Position.register_direction(Directions::WEST.identifier, Directions::WEST)
end
