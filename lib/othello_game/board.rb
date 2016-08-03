class Board

  def initialize(options)
    board_hash = options.fetch(:board)

    @width = board_hash[:width]
    @height = board_hash[:height]
    @max_index = board_hash[:'max-index']
    @squares = board_hash[:squares]
    setup_squares

    @player = options.fetch(:player)

    if @max_index >= @squares.length
      @max_index = @squares.length - 1
    end

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
    (0..@max_index).each do |i|
      if @squares[i] == '-' && (i < @width || i > @max_index - @width || i % @width == 0 || i % @width == 7)
        @squares[i] = 'x'
      end
    end
  end

  def get_valid_moves
    moves = []

    # gets the index of all of the players pieces
    player_pieces = @squares.each_index.select{ |i| @squares[i] == @player }
    p player_pieces

    #vertical
    player_pieces.each do |i|
      until @squares[i] == 'x' do
        p @squares[i]
        i = i - 8
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
