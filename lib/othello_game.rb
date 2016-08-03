#require "othello_game/version"
require 'bundler/setup'
require 'othello_game/board'
require 'othello_game/parser'
require 'optparse'

parser = Parser.new
options = parser.parse_command_line_args(ARGV)

board = Board.new(options)

puts "\nhello"
board.to_s
puts "\nworld"