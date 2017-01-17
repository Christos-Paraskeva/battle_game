require 'colorize'

class Game
  attr_reader :player_1, :player_2
  
  def initialize(name_player_1, name_player_2)
    $name_player_1 = name_player_1
    $name_player_2 = name_player_2
    $player_1 = { health: 350, energy: 250 } 
    $player_2 = { health: 350, energy: 250 }
  end
  
#  def player_move
#    while (@player_1[:health] && @player_2[:health]) > 0
#      puts "Which move would you like to use? (FIRE)?"
#      chosen_move = gets.chomp.downcase
#    end
#  end
  
  def fire_player_1
    $player_2[:health] -= rand(10..15)
    $player_1[:energy] -= rand(5..10)
    puts "
    \t\t\ #{$name_player_1} used FIRE on #{$name_player_2}"
    puts "\t\t\ #{$name_player_2} now has #{$player_2[:health]} health left..
    "
  end
  
  def fire_player_2
    $player_1[:health] -= rand(10..15)
    $player_2[:energy] -= rand(5..10)
    puts "
    \t\t\ #{$name_player_2} used FIRE on #{$name_player_1}"
    puts "\t\t\ #{$name_player_1} now has #{$player_1[:health]} health left..
    "
  end
  
  def special_move_player_1
    $player_2[:health] -= rand(15..30)
    $player_1[:energy] -= rand(12..27)
    puts "
    \t\t\ #{$name_player_1} used a SPECIAL move on #{$name_player_2}"
    puts "\t\t\ #{$name_player_2} now has #{$player_2[:health]} health left..
    "               
  end
  
  def special_move_player_2
    $player_1[:health] -= rand(15..30)
    $player_2[:energy] -= rand(12..27)
    puts "
    \t\t\ #{$name_player_2} used a SPECIAL move on #{$name_player_1}"
    puts "\t\t\ #{$name_player_1} now has #{$player_1[:health]} health left..
    "               
  end
  
  def defend_player_1
    $player_1[:health] += rand(1..2)
    $player_1[:energy] += rand(1..2)
    puts "
    \t\t\ #{$name_player_1} used a DEFENSIVE move to block #{$name_player_2}"
    puts "\t\t\ #{$name_player_1} now has #{$player_1[:health]} health left..
    "
  end
  
  def defend_player_2
    $player_2[:health] += rand(2..5)
    $player_2[:energy] += rand(5..10)
    puts "
    \t\t\ #{$name_player_2} used a DEFENSIVE move to block #{$name_player_1}"
    puts "\t\t\ #{$name_player_2} now has #{$player_2[:health]} health left..
    "
  end                  
  
  def print_scoreboard
    puts "-------------------------------------------------------------"
    puts "                        Scoreboard                           "
    puts "-------------------------------------------------------------"
    puts "
    \t\t\t\ #{$name_player_1}
    
    \t\t\ Health: #{$player_1[:health]} | Energy: #{$player_1[:energy]}".colorize(:blue)
    puts "
-------------------------------------------------------------"
    puts "
    \t\t\t\ #{$name_player_2}
    
    \t\t\ Health: #{$player_2[:health]} | Energy: #{$player_2[:energy]}".colorize(:red)
    puts "
-------------------------------------------------------------"
  end
end


puts "\t \t \t       Welcome To My Game!".colorize(:blue)

80.times do
  print '.'
  sleep(rand(0.01..0.02))
end

puts "

Can you select the right combination of moves to win??

".colorize(:blue)

sleep(1)

puts "
You have three moves that you can use, but make sure not to use up 
all your energy!".colorize(:red)
puts "

FIRE Attack: Will take a varied but standard amount
of health of opponent and your own energy.".colorize(:blue)
puts"

SPECIAL Attack: Will take a varying higher amount of health of opponent 
but will also depleat more of your energy.".colorize(:red)
puts "

DEFEND:  This will give you a small health and energy boost, but you skip
a go.".colorize(:blue)
puts "

The health / energy penalty for any of these moves will always be changing!".colorize(:green)

16.times do
  print '.....'
  sleep(rand(0.06..0.07))
end

puts "


"

sleep(0.2)

print "What would you like your character to be called? 
>>  ".colorize(:red)
name_1 = gets.chomp.capitalize

print "What is the name of your opponent? 
>>  ".colorize(:red)
name_2 = gets.chomp.capitalize


game = Game.new(name_1, name_2)

player_2_list_moves = [ 'f', 'f', 'f', 's', 's', 'd' ]

while ($player_1[:health] > 0 && $player_1[:energy] > 0) && ($player_2[:health] > 0 && $player_2[:energy] > 0)
  print "Which move would you like to make? ('F' = Fire, 'S' = Special, 'D' = Defence)?
>>  ".colorize(:red)  
  player_1_chosen_move = gets.chomp.downcase
  
  case player_1_chosen_move
    when 'f'
      game.fire_player_1
    when 's'
      game.special_move_player_1
    when 'd'
      game.defend_player_1
  end
    
  player_2_chosen_move = player_2_list_moves.sample
  case player_2_chosen_move
    when 'f'
      game.fire_player_2
    when 's'
      game.special_move_player_2
    when 'd'
      game.defend_player_2
  end  
    game.print_scoreboard
end

game.print_scoreboard

test
