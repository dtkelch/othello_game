class Board

  def initialize(options)
    board_hash = options.fetch(:board)

    @width = board_hash[:width]
    @height = board_hash[:height]
    @max_index = board_hash[:'max-index']
    @squares = board_hash[:squares]
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

  def get_valid_moves
    moves = []

    #vertical

    #horizontal

    #diagonal
    # down left -> right
    # up left -> right
    # down right -> left
    # up left -> right

    moves
  end




end
