require './engine'

entry = Engine.new

puts 'If yoy wanna leave please write q'

loop do
  input = gets

  break if %w[q exit].include? input.downcase.strip

  command = input.split(' ').first

  args = input.split(' ').last.split(',').map(&:strip)

  begin
    result = entry.run_command(command, *args)

    if result.is_a?(String)
      puts result
    else
      puts 'Command executed...'
    end
  rescue => ex
    puts ex.message
  end

end