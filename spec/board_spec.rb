require 'spec_helper'

describe Board do
  board = Board.new({:player: 'b'
           :board: {
             "width": 8,
             "height": 8,
             "max-index": 63,
             "squares": ["-","-","-","-","-","-","-","-",
                         "-","-","-","-","-","-","-","-",
                         "-","-","-","-","-","-","-","-",
                         "-","-","-","w","b","-","-","-",
                         "-","-","-","b","w","-","-","-",
                         "-","-","-","-","-","-","-","-",
                         "-","-","-","-","-","-","-","-",
                         "-","-","-","-","-","-","-","-"]
           }


          })
  it 'has a version number' do
    expect(OthelloGame::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end

  it 'finds valid moves' do
    moves = board.get_valid_moves
    expect(moves).to_eq([])
  end

  it 'creates a board' do
    
  end
end
