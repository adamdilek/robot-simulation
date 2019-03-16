module Directions
  class Base
    class << self
      def identifier
        name.to_s.upcase.split('::').last
      end
    end
  end
end
