require 'board'


class Game 

	attr_accessor :player_1, :player_2, :board

def start_game # Début de partie, on récupère le nom des joueurs et on crée les deux instances (joueur_1 qui est les "X" et joueur 2 qui est les "O")
	puts "==============================================".colorize(:red)
	puts "BIENVENUE DANS LE NOUVEAU SUPER JEU DU MORPION".colorize(:blue)
	puts "==============================================".colorize(:red)
	puts 
	puts "Tu connais les règles ? (Y/N) "
	regle = gets.chomp
	if regle == "Y"
		puts "Alors let's go champion !"
	else regle == "N"
	puts 
	puts
	puts "C'est très simple, deux joueurs, un plateau de jeu. Le but est de faire une combinaison de 3 symboles ('X' ou 'O') en horizontale, diagonale ou verticale"
	end
	puts 
	puts "==============================================".colorize(:red)
	puts "On va commencer, je vais avoir besoin du nom du premier joueur :"
	print ">"
	name_player_1 = gets.chomp
	@player_1 = Player.new(name_player_1 ,"X")
	puts "Le joueur n°1, sera #{name_player_1} et aura les #{@player_1.symbole}"
	puts "Et maintenant peux tu me communiquer le nom du deuxième joueur :"
	print ">"
	name_player_2 = gets.chomp
	@player_2 = Player.new(name_player_2 ,"O")
	puts "Le joueur n°2, sera #{name_player_2} et aura les #{@player_2.symbole}"
	puts "Vous êtes prêts ? C'est parti ! "
	puts "==============================================".colorize(:red)
	puts "#{name_player_1} va commencer à jouer !"
	puts 
	puts "Voici le plateau de jeu (Entrée pour continuer):"
end 

end