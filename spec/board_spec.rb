require 'spec_helper'
require 'othello_game/board'

describe Board do

  before do
    @options = {:player => 'b',
                :board => {
                  :width => 8,
                  :height => 8,
                  :"max-index" => 63,
                  :squares =>["-","-","-","-","-","-","-","-",
                              "-","-","-","-","-","-","-","-",
                              "-","-","-","-","-","-","-","-",
                              "-","-","-","w","b","-","-","-",
                              "-","-","-","b","w","-","-","-",
                              "-","-","-","-","-","-","-","-",
                              "-","-","-","-","-","-","-","-",
                              "-","-","-","-","-","-","-","-"]
                }
            }
    @board = Board.new(@options)
    @valid_moves = [19, 26, 37, 43]
    end
  it 'finds valid moves' do
    # board = Board.new(@options)
    moves = @board.calculate_move
    expect(moves).to eql(@valid_moves)
  end

  it 'has any valid moves' do
    expect(@board.any_valid_move?).to eql(true)
  end

  it 'can calculate move' do
    expect(@board.calculate_move.length).to eql(1)
  end

  it 'has valid moves' do
    expect(@board.valid_moves).to eql(@valid_moves)
  end

  it 'computes a valid move at position 19' do
    expect(@board.valid_move?(19)).to eql(19)
  end

  it 'computes no valid moves at position 1' do
    expect(@board.valid_move?(1)).to eql(-1)
  end

end
