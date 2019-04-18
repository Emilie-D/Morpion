require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__) 

require'board'
require'game'
require'player'

first_game = Game.new
first_board = Board.new
first_game.start_game
first_board.puts_board
first_board.turn

#binding.pry