class Board
  def initialize(options)
    board_hash = options.fetch(:board)

    @width = board_hash[:width]
    @height = board_hash[:height]
    @max_index = board_hash[:'max-index']
    @squares = board_hash[:squares]
    # setup_squares

    @player = options.fetch(:player)
    @opponent = @player == 'b' ? 'w' : 'b'

    if @max_index >= @squares.length
      @max_index = @squares.length - 1
    end

    @directions = {:up => -@width,
                    :down => @width,
                    :left => -1,
                    :right => 1,
                    :up_left => -(@width + 1),
                    :up_right => -(@width -1),
                    :down_left => (@width -1),
                    :down_right => (@width + 1)
                  }


    if @width != @height
      print "error"
    end
  end

  def to_s
    (0..@max_index).each do |i|
      print "#{@squares[i]}" + ((i % 8 == 7) ? "\n" : "\t")
    end
  end

  def can_move_further(position, direction)
    d = @directions[direction]
    row = position / @width # int, round down
    print "Row: ", row, "\n"
    max_row = @width - 1
    row_start = row * @width
    row_end = row_start + @width - 1
    prev_start = row_start - @width
    prev_end = row_end - @width
    next_start = row_start + @width
    next_end = row_end + @width
    next_pos = position + d

    case direction
    when :up
      return row > 0
    when :down
      return row < max_row
    when :left
      return position > row_start
    when :right
      return position < row_end
    when :up_left
      return row > 0 && next_pos >= prev_start
    when :up_right
      return row > 0 && next_pos <= prev_end
    when :down_left
      return row < max_row && next_pos >= next_start
    when :down_right
      return row < max_row && next_pos <= next_end
    else
      false
    end
  end

  def find_bracketing_piece(position, direction)
    if @squares[position] == @player
      return position
    elsif @squares[position] == @opponent && can_move_further(position, direction)
      return find_bracketing_piece((position + @directions[direction]), direction)
    else
      nil
    end
  end

 def would_flip?(position, direction)
    if can_move_further(position, direction)
      position = position + @directions[direction]
      index = find_bracketing_piece(position, direction)
      if @squares[position] == @opponent && index
         return true
      end
    end
    false
  end

  def valid_move?(position)
    moves = []
    if position >= 0 && position <= @max_index && @squares[position] == '-'
      @directions.each do |dir, val|
        if would_flip?(position, dir)
          print position, " ", dir, "\n"
          return true
        end
      end
    end
    false
  end

  def valid_moves
    moves = []
    (0..@max_index).each do |i|
      if valid_move?(i)
        moves << i
      end
    end
    moves
  end

  def any_valid_move?
    # valid_move?
    true
  end

  def calculate_move #done
    moves = [-1]
    if any_valid_move?
      moves = valid_moves
    end
    p moves
    moves
  end

  def valid_moves_for_player
    moves = []

    player_pieces = @squares.each_index.select{ |i| @squares[i] == @player }

    player_pieces.each do |i|
      # (0..@max_index).each do |i|
        @directions.each do |direction, v|
          if can_move_further(i, direction)
            p i, direction
          end
        # end
      valid_move?(i)
      end
    end
  end
end





# def can_move_further(position, direction)
#   row = position / @width # int, round down
#   max_row = @max_index - @width + 1
#   row_start = row * @width
#   row_end = row_start + @width - 1
#   prev_start = row_start - @width
#   prev_end = row_end - @width
#   next_start = row_start + @width
#   next_end = row_end + @width
#   next_pos = position + @directions[direction]

#   case direction
#   when :up
#     return row > 0
#   when :down
#     return row > 0
#   when :left
#     return position > row_start
#   when :right
#     return position < row_end
#   when :up_left
#     return row > 0 && next_pos >= prev_start
#   when :up_right
#     return row > 0 && next_pos <= prev_end
#   when :down_left
#     return row < max_row && next_pos >= next_start
#   when :down_right
#     return row < max_row && next_pos <= next_end
#   else
#     false
#   end
# end









  # # lines the edges with "x", to make bounds checking easier
  # def setup_squares
  #   #@squares.each_with_index do |s, i|


  #   # new_board = [@width * @height]
  #   # @max_index = new_board.length - 1

  #   # (0..@max_index).each do |i|
  #     # if @squares[i] == '-' && (i < @width || i > @max_index - @width || i % @width == 0 || i % @width == 7)
  #       # @squares[i] = 'x'
  #     # end
  #   # end

  #   @width = @width + 2
  #   @height = @height + 2
  #   new_board = [(@width + 2) * (@height + 2)]
  #   @max_index = new_board.length - 1

  #   # offset = (i / 4) + @width



  # end










  # def get_valid_moves
  #   moves = []
  #   @opponent = @player == 'b' ? 'w' : 'b'

  #   # gets the index of all of the players pieces
  #   player_pieces = @squares.each_index.select{ |i| @squares[i] == @player }
  #   p player_pieces

  #   left_edge = []
  #   top_edge = 0
  #   bottom_edge = 0
  #   right_edge = []

  #   [(-(@width + 1), -2), -@width, -(@width - 1), -1, 1, (@width - 1), @width, (@width + 1)].each do |offset|
  #     p offset
  #   end
  #   #vertical
  #   limit = @width
  #   player_pieces.each do |i|
  #     until @squares[i] == '-' || i <= limit do
  #     # while @squares[i] == @opponent && i > limit do
  #       # i = i + offset
  #        p @squares[i]
  #       i = i + offset
  #     end

  #   end

  #   #horizontal

  #   #diagonal
  #   # down left -> right
  #   # up left -> right
  #   # down right -> left
  #   # up left -> right

  #   moves
  # end


#  def is_valid_move (loc, direction, limit, points)
#   dest = loc + offset
#   @opponent = @player == 'b' ? 'w' : 'b'
#   if valid
#     points = points + 1
#     is_valid_move(dest, direction, limit, points)
#   end
# end

# def is_valid_move (loc, direction, limit, points)
#   direction = -8
#   limit = 8
#   dest = loc + offset
#   @opponent = @player == 'b' ? 'w' : 'b'
#   if valid
#     points = points + 1
#     is_valid_move(dest, direction, limit, points)
#   end
# end























