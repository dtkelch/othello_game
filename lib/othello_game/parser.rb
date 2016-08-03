require 'json'
require 'optparse'


class Parser
  def parse_command_line_args(argv)
    options = {}

    OptionParser.new do |opts|
      opts.on("-bBOARD") do |board|
        options[:board] = parse_json(board)
      end

      opts.on("-pPLAYER") do |player|
        options[:player] = player
      end

      opts.on("-tTIME") do |time|
        options[:time] = time
      end
    end.parse!

    options
  end

  def parse_json(board_state)
    JSON.parse(board_state, :symbolize_names => true)
  end

  def serialize_json(board_state)
    #JSON.dump object #returns a JSON string
    #JSON.generate object #returns a JSON string
    #object.to_json #returns a JSON string
  end
end
