class Board
   attr_accessor :cells

   def initialize
      reset!
   end

   #clear board to array with 9 " "
   def reset!
      @cells=[" "," "," "," "," "," "," "," "," "]
   end

   def display
      puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
      puts "-----------"
      puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
      puts "-----------"
      puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
   end

   def position(inp)
      cells[(inp.to_i)-1]
   end

   def full?
      !cells.include?(" ")
   end

   def turn_count
      9-cells.count(" ")
   end

   def taken?(pos)
      cells[pos.to_i-1]!=" "
   end

   def valid_move?(pos)
      if pos.to_i>0&&pos.to_i<=9&&!full?
         !taken?(pos)
      else
         false
      end
   end

   def update(pos,obj)
      if valid_move?(pos)
         cells[(pos.to_i)-1]=obj.token
      end
   end

end