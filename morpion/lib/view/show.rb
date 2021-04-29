class Show
  attr_accessor :board

  def initialize
  end

  def show_board(board)
    puts " " * 4 + "1".green + " " * 3 + "2".green + " " * 3 + "3".green
    puts "-".green * 15
    puts "A | ".green + board.list_boardcase[0].symbol.yellow + " | ".green + board.list_boardcase[1].symbol.yellow + " | ".green + board.list_boardcase[2].symbol.yellow + " |".green
    puts "-".green * 15
    puts "B | ".green + board.list_boardcase[3].symbol.yellow + " | ".green + board.list_boardcase[4].symbol.yellow + " | ".green + board.list_boardcase[5].symbol.yellow + " |".green
    puts "-".green * 15
    puts "C | ".green + board.list_boardcase[6].symbol.yellow + " | ".green + board.list_boardcase[7].symbol.yellow + " | ".green + board.list_boardcase[8].symbol.yellow + " |".green
    puts "-".green * 15
  end
  
end

