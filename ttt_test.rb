require 'test/unit'
require_relative 'tic-tac-toe'

class TicTacToeTest < Test::Unit::TestCase

  # def test_board__new
  #   input_filename = "input_1.txt"
  #   board = make_board(input_filename)
  #   assert_equal [6, 3], board.current_position
  #
  #   assert_board_initialization(input_filename, board)
  #
  # end
  #
  # def test_board__new__missing_squares
  #   input_filename = "input_2.txt"
  #   board = make_board(input_filename)
  #   assert_equal [5, 2], board.current_position
  #
  #   assert_board_initialization(input_filename, board)
  # end
  #
  # def test_board__removal_candidates__starting_position
  #   input_filename = "input_1.txt"
  #   board = make_board(input_filename)
  #
  #   assert_equal [6, 3], board.current_position
  #   assert_equal [[0, 1], [0, 2], [0, 4], [0, 5],
  #                 [1, 1], [1, 2], [1, 3], [1, 4], [1, 5],
  #                 [2, 1], [2, 2], [2, 3], [2, 4], [2, 5]],
  #                board.removal_candidates([5, 3])
  # end
  #
  # def test_board__removal_candidates__some_moves
  #   input_filename = "input_2.txt"
  #   board = make_board(input_filename)
  #
  #   assert_equal [5, 2], board.current_position
  #   assert_equal [[0, 1], [0, 2], [0, 3], [0, 4], [0, 5],
  #                 [1, 1], [1, 2], [1, 4], [1, 5],
  #                 [2, 1], [2, 2], [2, 3], [2, 4], [2, 5],
  #                 [3, 2], [3, 3], [3, 4], [3, 5]],
  #                board.removal_candidates([5, 3])
  # end
  #
  # def test_board__removal_candidates__mostly_constrained
  #   input_filename = "input_3.txt"
  #   board = make_board(input_filename)
  #
  #   assert_equal [5, 2], board.current_position
  #   assert_equal [[0, 3], [1, 4]],
  #                board.removal_candidates([5, 3])
  # end
  #
  #
  # def test_board__removal_candidates__super_blocked
  #   input_filename = "input_4.txt"
  #   board = make_board(input_filename)
  #
  #   assert_equal [5, 2], board.current_position
  #   assert_equal [[0, 0]],
  #                board.removal_candidates([5, 3])
  # end
  #
  # def test_board__all_neighbors
  #   input_filename = "input_3.txt"
  #   board = make_board(input_filename)
  #
  #   assert_equal [5, 2], board.current_position
  #   neighbors = board.all_neighbors(board.current_position)
  #   assert_equal [[4, 1], [4, 2], [4, 3], [5, 1], [5, 3], [6, 1], [6, 2], [6, 3]], neighbors
  # end
  #
  # def test_board__valid_neighbors
  #   input_filename = "input_3.txt"
  #   board = make_board(input_filename)
  #
  #   assert_equal [5, 2], board.current_position
  #   neighbors = board.valid_neighbors(board.current_position)
  #   assert_equal [[5, 1], [5, 3]], neighbors
  # end
  #
  # def test_board__buggy_behavior
  #   input_filename = "input_4.txt"
  #   board = make_board(input_filename)
  #
  #   assert_equal [0, 0], board.current_position
  #   assert_equal [[1, 1]], board.unnoccupied_neighbors(board.current_position)
  # end
  #
  # def test_removal_candidates
  #   input_filename = "input_1.txt"
  #   board = make_board(input_filename)
  #
  #   assert_equal [], board.removal_candidates
  # end
  #
  #
  # private
  #
  # def assert_board_initialization(input_filename, board)
  #   File.open(input_filename,"r") do |file|
  #     file.each_with_index do |line, index|
  #       break if index > 6
  #       assert_equal line.split(' ').map(&:to_i), board.board[index]
  #     end
  #   end
  # end
  #
  # def make_board(input_filename)
  #   b = nil
  #   with_stdin do |command_line|
  #     File.open(input_filename,"r") do |file|
  #       file.each do |line|
  #         command_line.puts line
  #       end
  #     end
  #
  #     b = Board.new
  #   end
  #   b
  # end
  #
  # def with_stdin
  #   stdin = $stdin             # remember $stdin
  #   $stdin, write = IO.pipe    # create pipe assigning its "read end" to $stdin
  #   yield write                # pass pipe's "write end" to block
  # ensure
  #   write.close                # close pipe
  #   $stdin = stdin             # restore $stdin
  # end
  #
end
