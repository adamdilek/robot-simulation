module Directions
  # EAST class responsible for detecting left, right and
  # movement position by itself.
  class EAST < Base
    class << self
      def right
        Directions::SOUTH
      end

      def left
        Directions::NORTH
      end

      def forward_unit
        1
      end

      def plane_position
        'x'
      end
    end
  end

  Position.register_direction(Directions::EAST.identifier, Directions::EAST)
end
