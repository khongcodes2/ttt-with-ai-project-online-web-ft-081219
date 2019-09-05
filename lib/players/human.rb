module Players
   class Human < Player
      def move(board)
         inp=gets
         #binding.pry
         board.update(inp,self)
         if board.valid_move?(inp)
            "invalid"
         else
            inp
         end
      end
   end
end