require 'game'

class Board < Game

attr_accessor :board 

def initialize #On crée un hash avec pour clés les noms des cases du morpion et pour valeur " " car elles sont vides
	@board = {'A1' => ' ', 'A2' => ' ', 'A3' => ' ', 'B1' => ' ',  'B2' => ' ', 'B3' => ' ', 'C1' => ' ', 'C2' => ' ', 'C3' => ' '}
end 

def puts_board #permet d'afficher notre tableau 
	puts " A | B | C "
	puts "-"*12
	puts " #{@board['A1']} | #{@board['B1']} | #{@board['C1']}"
	puts "-"*12
	puts " #{@board['A2']} | #{@board['B2']} | #{@board['C2']}"
	puts "-"*12
	puts " #{@board['A3']} | #{@board['B3']} | #{@board['C3']}"
end 

def choice_1 #permet au joueur_1 de jouer en récupérant son choix et en mettant une "X" à la place
	puts "Que veux tu faire ? (rentre le numéro de la case que tu veux remplir)"
	print ">"
	choice_player = gets.chomp
	if @board[choice_player] == " "
		@board[choice_player] = "X".colorize(:green)
	elsif @board[choice_player] == "X" || @board[choice_player] == "O" 
		puts "Cette case est déjà prise !"
		choice_1
	else puts "Cette case n'existe pas"
		choice_1
	end
end 


def choice_2 #permet au joueur_2 de jouer en récupérant son choix et en mettant un "O" à la place
	puts "Que veux tu faire ? (rentre le numéro de la case que tu veux remplir)"
	print ">"
	choice_player = gets.chomp
	if @board[choice_player] == " "
		@board[choice_player] = "O".colorize(:blue)
	elsif @board[choice_player] == "X" || @board[choice_player] == "O" 
		puts "Cette case est déjà prise !"
		choice_2
	else puts "Cette case n'existe pas"
		choice_2
	end
end 


def victory? #si une des ces combinaisons se réalise c'est une victoire 
	if ((board['A1'] == board['A2']) && (board['A1'] == board['A3']) && (board['A1'] != ' ')) ||
     ((board['B1'] == board['B2']) && (board['B1'] == board['B3']) && (board['B1'] != ' ')) ||
     ((board['C1'] == board['C2']) && (board['C1'] == board['C3']) && (board['C1'] != ' ')) ||
     ((board['A1'] == board['B1']) && (board['A1'] == board['C1']) && (board['A1'] != ' ')) ||
     ((board['A2'] == board['B2']) && (board['A2'] == board['C2']) && (board['A2'] != ' ')) ||
     ((board['A3'] == board['B3']) && (board['A3'] == board['C3']) && (board['A3'] != ' ')) ||
     ((board['A1'] == board['B2']) && (board['A1'] == board['C3']) && (board['A1'] != ' ')) ||
     ((board['A3'] == board['B2']) && (board['A3'] == board['C1']) && (board['A3'] != ' '))
     return true 
  else
   	 return false 
	end
end

def match_nul? #si il n'y a pas de victoire et que plus aucune case n'est vide c'est un match nul 
	i = 0
	@board.each do |k, v|
		if v == " "
			i += 1
		end 
	end
	if i == 0
		return true
	else
		return false
	end
end



def turn #exécute l'ensemble du programme 
	number_turn = 0
	while 1
	  choice_1
	  puts_board
	  if victory? == true
	  	puts "Féliciation #{name_player_1}, tu as gagné"
	  	exit
	  end
	  if match_nul? == true
	  	puts "La partie est terminée.. Match nul"
	  	exit
	  end
	  choice_2
	  number_turn += 1
	  #puts number_turn
	  puts_board
	  if victory? == true
	  	puts "Féliciation #{name_player_2}, tu as gagné"
	  	exit
	  end
	  if match_nul? == true
	  	puts "La partie est terminée.. Match nul"
	  	exit
	  end
	end
end 

end