#require "othello_game/version"
require 'bundler/setup'
require 'othello_game/board'
require 'othello_game/parser'
require 'optparse'

parser = Parser.new
options = parser.parse_command_line_args(ARGV)
puts "parse_command_line_args"
puts options
puts "parse_command_json"
puts "options: " + options.to_s

board = Board.new(options)

puts "\nhello"
board.to_s
puts "\nworld"
