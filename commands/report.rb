module Commands
  class Report < Base
    def execute
      "Output: #{@robot.position.x}, #{@robot.position.y}, #{@robot.position.f.identifier}"
    end
  end
end