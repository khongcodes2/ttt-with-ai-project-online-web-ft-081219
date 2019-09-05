module Players
   class Computer < Player
      WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
      @my_cells=[]
      @finish=[]
      
      def move(board)
         @my_cells=[]

         if board.turn_count>1
            @finish=WIN_COMBINATIONS.select do |arr|
               #collect the array if my_cells has 2 out of the 3 spots in it, into an array of arrays
               #if the 3rd spot in the first index is taken, try to take the 3rd spot in the next one
               #return true if arr contains 2 of the 3
               aa=arr.map{|n|@my_cells.include?(n)}
               ((aa[0]&&aa[1])||(aa[1]&&aa[2]))||(aa[0]&&aa[2])
            end
            
            @finish.flatten.each do |a|
               unless board.taken?(a)
                  @my_cells.push(a)
                  return "#{a}"
               end
            end

         end
         
         #binding.pry

         #do middle
         if !board.taken?(4)
            @my_cells.push(4)
            return "4"
         elsif !board.taken?(0)
            @my_cells.push(0)
            return "0"
         else
            num=rand(1..9)
            while board.taken?(num) do
               num=rand(1..9)
            end
            @my_cells.push(num)
            return "#{num}"
         end

         
      end

   end
end