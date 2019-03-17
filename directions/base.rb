module Directions
  #
  #
  #                  NORTH(+y)
  #                     |
  #                     |
  #                     |
  #                     |
  #                     |(0,0)
  #  WEST(-x)-----------|----------EAST(+x)
  #                     |
  #                     |
  #                     |
  #                     |
  #                     |
  #                  SOUTH(-y)
  #
  #
  class Base
    class << self
      def identifier
        name.to_s.upcase.split('::').last
      end

      def forward_unit
        raise CustomErrors::MustBeImplemented
      end
    end
  end
end
