if ARGV.length > 1
#require "othello_game/version"
require 'bundler/setup'
require 'othello_game/board'
require 'othello_game/parser'
require 'optparse'
  parser = Parser.new
  options = parser.parse_command_line_args(ARGV)

  # provide a default time if none given
  time = options.fetch(:time, 10000)

  board = Board.new(options)

  puts "\n\n\n"

  board.to_s
  #board.valid_moves_for_player
  board.calculate_move
  puts "\n\n\n"
else
  puts "no options given"
end

