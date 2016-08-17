if ARGV.length > 1
# require "othello_game/version"
require 'bundler/setup'
require_relative 'othello_game/board'
require_relative 'othello_game/parser'
require 'optparse'
require 'bundler/setup'
# require 'othello_game/board'
# require 'othello_game/parser'
# require 'optparse'
  parser = Parser.new
  options = parser.parse_command_line_args(ARGV)

  p "options", options
  # provide a default time if none given
  time = options.fetch(:time, 10000)

  board = Board.new(options)

  puts "\n\n\n"

  board.to_s
  #board.valid_moves_for_player
  moves = board.calculate_move
  if moves.length
    n = moves.length - 1
    move = moves[rand(0..n)]
    p move
    exit(move)
  else
    exit(-1)
  end
  puts "\n\n\n"
else
  puts "no options given"
  exit(-1)
end

