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
    end
  it 'finds valid moves' do
    # board = Board.new(@options)
    moves = @board.calculate_move
    expect(moves).to eql([19, 26, 37, 43])
  end

  it 'has valid moves' do
    expect(@board.any_valid_move?).to eql(true)
  end
end
