
require_relative 'game'

class Application
  attr_accessor :joueur_1, :joueur_2, :game 

  @@game_counter=0

  def initialize
    @game = Game.new
    # initialisation d'une partie
    while @game.status == 'en cours'
      @game.turn
      # tour des joueurs
      @game.game_end
      # Message de fin de jeu
      @game.new_round
      #demande de rejouer ou partir

    end

  end
end