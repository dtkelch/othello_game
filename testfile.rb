require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  opts.on("-b", "--black", "AI Strategy for the black player") do
    options[:player] = 'b'
  end

  opts.on("-w", "--white", "AI Strategy for the white player") do
    options[:player] = 'w'
  end

  opts.on("-u", "--ui", "User interface type, one of [console, gui]") do |ui|
    options[:ui] = ui
  end

  opts.on("-m", "--min-turn-time", "Minimum amount of time to wait between turns") do |min|
    options[:min_turn] = min
  end

end.parse!

p options
p ARGV
