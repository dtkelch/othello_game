class Board
  # TODO
  # enum:
  #   UP_LEFT: direction = -(@width+1), (block)bounds = < 8, outside of 0, 8, 16,...
  #   UP: direction = -@width, bounds = < 8
  #   UP_RIGHT: direction = -(@width-1), bounds = < 8, outside of 7, 15, 23,....
  #   LEFT: direction = -1, bounds = outside of 0, 8, 16,...
  #   RIGHT: direction = 1, bounds = outside of 7, 15, 23,...
  #   DOWN_LEFT: direction = (@width-1), bounds > 56, outside of 0, 8, 16
  #   DOWN: direction = @width, bounds > 56
  #   DOWN_RIGHT: direction = (@width + 1), bounds > 56, outside of 7, 15, 23

  def initialize(options)
    board_hash = options.fetch(:board)

    @width = board_hash[:width]
    @height = board_hash[:height]
    @max_index = board_hash[:'max-index']
    @squares = board_hash[:squares]
    # setup_squares

    @player = options.fetch(:player)

    if @max_index >= @squares.length
      @max_index = @squares.length - 1
    end

    # TODO
    @max_up = @width
    @max_left = (0, @max_index, 8) #0, 8, 16, etc
    @max_right= (@width-1, @max_index, 8) #7, 15, 23, etc
    @max_down = @max_index-@width+1

    if @width != @height
      print "error"
    end
  end

  def to_s
    (0..@max_index).each do |i|
      print "#{@squares[i]}" + ((i % 8 == 7) ? "\n" : "\t")
    end
  end

  # lines the edges with "x", to make bounds checking easier
  def setup_squares
    #@squares.each_with_index do |s, i|


    # new_board = [@width * @height]
    # @max_index = new_board.length - 1

    # (0..@max_index).each do |i|
      # if @squares[i] == '-' && (i < @width || i > @max_index - @width || i % @width == 0 || i % @width == 7)
        # @squares[i] = 'x'
      # end
    # end

    @width = @width + 2
    @height = @height + 2
    new_board = [(@width + 2) * (@height + 2)]
    @max_index = new_board.length - 1

    # offset = (i / 4) + @width



  end

  def get_valid_moves
    moves = []
    opponent = @player == 'b' ? 'w' : 'b'

    # gets the index of all of the players pieces
    player_pieces = @squares.each_index.select{ |i| @squares[i] == @player }
    p player_pieces

    left_edge = []
    top_edge = 0
    bottom_edge = 0
    right_edge = []

    [(-(@width + 1), -2), -@width, -(@width - 1), -1, 1, (@width - 1), @width, (@width + 1)].each do |offset|
      p offset
    end
    #vertical
    limit = @width
    player_pieces.each do |i|
      until @squares[i] == '-' || i <= limit do
      # while @squares[i] == opponent && i > limit do
        # i = i + offset
         p @squares[i]
        i = i + offset
      end

    end

    #horizontal

    #diagonal
    # down left -> right
    # up left -> right
    # down right -> left
    # up left -> right

    moves
  end




end

def is_valid_move (loc, direction, limit, points)
  dest = loc + offset
  opponent = @player == 'b' ? 'w' : 'b'
  if valid
    points = points + 1
    is_valid_move(dest, direction, limit, points)
  end
end

def is_valid_move (loc, direction, limit, points)
  direction = -8
  limit = 8
  dest = loc + offset
  opponent = @player == 'b' ? 'w' : 'b'
  if valid
    points = points + 1
    is_valid_move(dest, direction, limit, points)
  end
end

def is_valid_move (position, direction)
  row = position / @width # int, round down
  max_row = @max_index - @width + 1
  row_start = row * width
  row_end = row_start + @width - 1
  prev_start = row_start - @width
  prev_end = row_end - @width
  next_start = row_start + @width
  next_end = row_end + @width
  next_pos = position + direction

  if (direction == :up)
    return row > 0
  end

  if (direction == :down)
    return row < max_row
  end

  if (direction == :left)
    return position > row_start
  end

  if (direction == :right)
    return position < row_end
  end

  if (direction == :up_left)
    return row > 0 and next_pos >= prev_start
  end

  if (direction == :up_right)
    return row > 0 and next_pos <= prev_end
  end

  if (direction == :down_left)
    return row < max_row and next_pos >= next_start
  end

  if (direction == :down_right)
    return row < max_row and next_pos <= next_end
  end
end
