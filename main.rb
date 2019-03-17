require './engine'

entry = Engine.new

class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def blue
    colorize(34)
  end

  def pink
    colorize(35)
  end

  def light_blue
    colorize(36)
  end
end

puts 'If yoy wanna leave please write q'

loop do
  input = gets

  break if %w[q exit].include? input.downcase.strip

  command = input.split(' ').first

  args = input.split(' ').last.split(',').map(&:strip)

  begin
    result = entry.run_command(command, *args)

    if result.is_a?(String)
      puts result.green
    else
      puts 'Command executed...'.blue
    end
  rescue => ex
    puts ex.message.red
  end

end