class TicTacToe

	POSSIBLE_VICTORIES = [
		['p1', 'p2', 'p3'], ['p4', 'p5', 'p6'], ['p7', 'p8', 'p9'], #rows
		['p1', 'p4', 'p7'], ['p2', 'p5', 'p8'], ['p3', 'p6', 'p9'],	#columns
		['p1', 'p5', 'p9'], ['p3', 'p4', 'p7']						#diagonals
	]

	PLAYERS = {:player_1 => 'x', :player_2 => 'o'}

	def initialize
		loop do
			@current_player = PLAYERS.keys.first
			play
		end
	end

	def play
		new_game_board
		introduction
		start_game
		end_of_game
	end

	private

		def new_game_board
			@game_board = {}
			(1..9).each { |i| @game_board["p#{i}"] = "p#{i}" }
		end

		def introduction			
			puts 'Hello! Welcome to tic-tac-toe :)'
			puts '--------------------------------'
		end

		def instruction
			puts "#{@current_player} enter a valid position:"
		end

		def print_game_board
			(0...3).each do |i| 
				puts "#{@game_board["p#{1 + 3 * i}"]} | #{@game_board["p#{ 2 + 3 * i}"]} | #{@game_board["p#{ 3 + 3 * i}"]}" 
				puts '------------'
			end
		end

		def start_game
			until (game_over? || won_game?)
				print_game_board
				instruction
				position = gets.chomp
				mark position
				next_player
			end
			@current_player = next_player
		end

		def end_of_game
			victory_message = "Congrats #{@current_player} you WON!! =D"
			game_over_message = 'Game Over! Play again. =('
			puts won_game? ? victory_message : game_over_message
		end

		def mark(position)
			@game_board[position] = PLAYERS[@current_player] if valid? position
		end

		def valid?(position)
			@game_board.has_key?(position) && !(filled? position)
		end

		def filled?(position)
			PLAYERS.values.include?(@game_board[position])
		end

		def next_player
			@current_player = @current_player == :player_1 ? :player_2 : :player_1
		end

		def game_over?
			filled_positions.length == @game_board.length
		end

		def won_game?
			POSSIBLE_VICTORIES.map do |possible_victory_sequence|
				winning_sequence?(get_values possible_victory_sequence)
			end.inject(:|)
		end

		def filled_positions
			@game_board.select { |key, value| PLAYERS.values.include?(value) }
		end

		def get_values(sequence)
			@game_board.select { |key, value| sequence.include?(key) }
		end

		def winning_sequence?(sequence)
			sequence.values.uniq.length == 1
		end
end

TicTacToe.new