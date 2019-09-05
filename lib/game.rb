class Game
   attr_accessor :board, :player_1, :player_2

   WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

   def initialize(p1=Players::Human.new("X"),p2=Players::Human.new("O"),brd=Board.new)
      @board=brd
      @player_1=p1
      @player_2=p2
   end

   def current_player
      if board.turn_count%2==0
         player_1
      else
         player_2
      end
   end
   
   def consult(obj)
      holder=WIN_COMBINATIONS.collect do |arr|
         arr.all?{|a|board.cells.map.with_index{|x,i|i if x==obj}.compact.include?(a)}
      end

      if holder.any?
         WIN_COMBINATIONS[holder.index(true)]
      else
         false
      end
   end

   def won?
      if consult("X")!=false
         consult("X")
      else
         consult("O")
      end
   end

   def draw?
      board.full?&&(consult("X")==false&&consult("Y")==false)
   end

   def over?
      draw?||!!won?
   end

   def winner
      if !!consult("X")
         "X"
      elsif !!consult("O")
         "O"
      else
         nil
      end
   end

   def turn
      if board.turn_count%2==0
         puts "Your turn, Player 1"
         t1=player_1.move(board)
         if t1=="invalid"
            puts "Invalid move. Try again:"
            t1=player_1.move(board)
         end
      else
         puts "Your turn, Player 2"
         t1=player_2.move(board)
         if t1=="invalid"
            puts "Invalid move. Try again:"
            player_2.move(board)
         end
      end
   end

   def play 
      9.times do
         #binding.pry
         break if over?
         turn
      end

      if !!consult("X")==true
         puts "Congratulations X!"
      elsif !!consult("O")==true
         puts "Congratulations O!"
      else
         puts "Cat's Game!"
      end


   end


end