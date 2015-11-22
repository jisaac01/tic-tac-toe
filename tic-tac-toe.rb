class Intelligence
  
  attr_accessor :game, :board_logic
  
  def initialize(game)
    self.game = game
    self.board_logic = game.board_logic
  end
  
  def get_best_move
    if game.possible_moves.size == 9
      "1 1"
    else
      next_move = minimax(true, board_logic.board.player_id, 0)[:move]
      "#{next_move.row} #{next_move.col}"
    end
  end
  
  def minimax(maximize, current_player, depth)
    best_score = maximize ? -10000 : 10000
    best_move = nil

    if board_logic.end_state?
      score = board_logic.score(!maximize) #because we're scoring for the previous turn
      best_score = score
    else    
      # available_moves = game.possible_moves.map { |move| Move.new(move.row, move.col) }
    
      game.possible_moves.each_with_index do |move, index|
        board_logic.hypothesize_move(move, current_player)
        next_player = ((current_player == 1) ? 2 : 1)
        if maximize
          result = minimax(false, next_player, depth + 1)

          if (result[:score] > best_score)
            best_score = result[:score]
            best_move = move
          end        
        else
          result = minimax(true, next_player, depth + 1)

          if (result[:score] < best_score)
            best_score = result[:score]
            best_move = move
          end
        end 
        board_logic.reset_move(move)
      end
    end    

    { :score => best_score, :move => best_move }
  end
  
end


# facts about the game state. Number of exits, relative strengths, pieces being considered for removal
class Game
  attr_accessor :board_logic
  
  def initialize(board_logic)
    self.board_logic = board_logic
  end
  
  def possible_moves
    board_logic.all_open_squares
  end
end

class Move
  attr_accessor :row, :col
  
  def initialize(row, col)
    self.row = row
    self.col = col
  end
  
  def to_s
    "#{row} #{col}"
  end
end

class Board
  attr_accessor :squares, :player_id, :opponent_id
  
  def initialize(squares, player_id)
    self.squares = squares
    self.player_id = player_id
    self.opponent_id = player_id == 1 ? 2 : 1
  end
  
  def to_s
    puts "Player #{player_id}'s board!: "
    squares.each do |row|
      puts " - - - "
      puts "|#{row.join('|').gsub('0',' ').gsub('1','X').gsub('2','O')}|" 
    end
      puts " - - - "
  end
  
  def each_square(&block)
    squares.each_with_index do |row, index|
      row.each_with_index do |val, jindex|
        yield index, jindex
      end
    end    
  end  
  
end

# facts about the game board: valid moves, winning state
class BoardLogic
  attr_accessor :board
  
  def initialize(squares, player_id)
    self.board = Board.new(squares, player_id)
  end

  def to_s
    board.to_s
  end
    
  def all_open_squares
    open_squares = [] 
    board.each_square do |row, col|
      open_squares << Move.new(row, col) if board.squares[row][col] == 0
    end
    open_squares
  end
  
  def hypothesize_move(move, player)
    board.squares[move.row][move.col] = (player == 1) ? 1 : 2
  end
  
  def reset_move(move)
    board.squares[move.row][move.col] = 0
  end
  
  def end_state?
    winner? || tie? 
  end
  
  def score(maximize)
    winner = winner?
    if maximize && winner #this is the result of the current player's move
      10
    elsif winner #this is the result of the opponent's move
      -10
    elsif tie?
      0
    end
  end
  
  def winner?
    horizontal_winner? ||
    vertical_winner? ||
    diagonal_winner?
  end    
  
  def tie?
    board.each_square do |row, column|
      return false if board.squares[row][column] == 0
    end
  end
  
  def horizontal_winner?
    board.squares[0].any? do |row|
      row[0] != 0 && 
      row[0] == row[1] && 
      row[0] == row[2]
    end
  end
  
  def vertical_winner?
    (0..2).any? do |column|
      board.squares[0][column] != 0 && 
      board.squares[0][column] == board.squares[1][column] && 
      board.squares[0][column] == board.squares[2][column]
    end
  end
  
  def diagonal_winner?
    (board.squares[0][0] != 0 &&
    board.squares[0][0] == board.squares[1][1] &&
    board.squares[0][0] == board.squares[2][2]) ||
    (board.squares[2][0] != 0 &&
    board.squares[2][0] == board.squares[1][1] &&
    board.squares[2][0] == board.squares[0][2])
  end
  
end

class Reader
  BOARDSIZE = 3
  def self.read
    input = []
    BOARDSIZE.times do 
      row = gets
      input << row
    end

    raise "Too many input lines!" if input.size > BOARDSIZE
      
    squares = []
    BOARDSIZE.times do |row|
      squares << input[row].scan(/-?\d+/).map(&:to_i)
    end
    
    player_id = gets.to_i
    [squares, player_id]
  end
end


def run
  squares, player_id = Reader.read
  current_board = BoardLogic.new(squares, player_id)
  game = Game.new(current_board)
  ai = Intelligence.new(game)
  puts ai.get_best_move
end

run
