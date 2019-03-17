require './engine'

entry = Engine.new

puts 'If yoy wanna leave please write q'

loop do
  input = gets

  break if %w[q exit].include? input.downcase.strip

  puts entry.run_command(*input.split(',').map(&:strip))
end