require_relative 'board'
require 'view/show'
require_relative 'player'


class Game
    attr_accessor :joueur_actuel, :status, :list_joueur, :board

  def initialize
    # création 2 joueurs, créé un board, met le status à "en cours", défini un joueur_actuel
    @joueur_1 = Player.new
    @joueur_2 = Player.new
    @list_joueur = [@joueur_1,@joueur_2]
    @status = 'en cours'

    # check du type de jeton
    if @joueur_1.joueur_symbol == @joueur_2.joueur_symbol
      puts "Attention, j'ai changé votre symbol car ils étaient identiques"
      if @joueur_1.joueur_symbol == 'X'
        @joueur_2.joueur_symbol = 'O'
      elsif @joueur_1.joueur_symbol == 'O'
        @joueur_2.joueur_symbol = 'X'
      end
    end
    @joueur_1.show_state
    @joueur_2.show_state
    # init du damier
    @board = Board.new
    # affiche le damier
    Show.new.show_board(@board)
  end

  def turn

    i=0
    while @status == 'en cours' && i<9
      @joueur_actuel = @list_joueur[i%2] 
      @board.play_turn(@board, @joueur_actuel)
      # cette methode permet de alterner le tour entre  joueur 
      # affiche tableau en-cours
      Show.new.show_board(@board)

      # check gagnant 
      if @board.victory?(@board)
        @status = 'gagnant '
        break
      end

      i+=1 # compte le nombre de tour 
    end
  end

  def new_round
    print "Voulez-vous faire une nouvelle partie (O/N) ? "
    
      choix= gets.chomp.upcase       
      
      if choix == 'O'
        @board = Board.new
        @status = "en cours"
        puts '-' * 20
        puts "Commençons une nouvelle partie !"
        Show.new.show_board(@board)
       
      elsif choix == 'N'
        puts "A bientot"
        exit
      end
      
      elsif
      new_round
      end

  end

  def game_end
    if @status == 'en cours'
      puts "Match nul"
    elsif @status == 'gagnant '
      puts "Bravo #{@joueur_actuel.joueur_nom}, t'as gagné"
    end
  end    

end
