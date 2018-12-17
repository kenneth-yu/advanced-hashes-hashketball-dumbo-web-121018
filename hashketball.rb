[require 'pry'

# Write your code here!
def game_hash
  game_hash = {
#---------------------------------------HOME TEAM -----------------------------------------------
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5 
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
#-----------------------------------------AWAY TEAM ------------------------------------------------   
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12 
        }

      }
    }
  }
end 

#-----------------------------------------------GAME_HASH END -----------------------------------------------
def slam_dunks(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_name, data|
      if player_name == name 
        return data[:slam_dunks]
      end 
    end 
  end
end


def num_points_scored(name)
  game_hash.each do |location, team_data|
    players_array = team_data[:players]
    players_array.each do |player_name, data| 
      if player_name == name
        return data[:points]
      end
    end 
  end 
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    players_array = team_data[:players]
    players_array.each do |player_name, data| 
      if player_name == name
        return data[:shoe]
      end
    end 
  end 
end

def team_colors(team)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      return team_data[:colors]
    end
  end
end 

def team_names
  answer = []
  game_hash.each do |location, team_data|
    answer.push(team_data[:team_name])
  end
  answer
end

def player_numbers(team)
  answer = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      players_array = team_data[:players]
      players_array.each do |player_name, data|
        answer.push(data[:number])
      end 
    end
  end 
  return answer
end 

def player_stats(name)
  game_hash.each do |location, team_data|
    players_array = team_data[:players]
    players_array.each do |player_name, data| 
      if player_name == name
        return data
      end
    end 
  end 
end

def big_shoe_rebounds
  shoe_size = 0
  rebounds = 0 
    game_hash.each do |location, team_data|
    players_array = team_data[:players]
    players_array.each do |player_name, data| 
      if data[:shoe] > shoe_size
        shoe_size = data[:shoe]
        rebounds = data[:rebounds]
      end
    end 
  end 
  return rebounds
end

#-------------------------------------------- Bonus Questions ----------------------------------------------------

def most_points_scored
  points = 0 
  person =""
    game_hash.each do |location, team_data|
      players_array = team_data[:players]
      players_array.each do |player_name, data| 
        if data[:points] > points
          person = player_name
          points = data[:points]
        end
      end 
    end 
  return person
end

def winning_team
  points1 = 0 
  points2 = 0
  team1 = "Brooklyn Nets"
  team2 = "Charlotte Hornets"
  game_hash.each do |location, team_data|
    if team_data[:team_name] == "Brooklyn Nets"
      team1_array = team_data[:players]
      team1_array.each do |player_name, data| 
          points1 += data[:points]
      end
    else
      team2_array = team_data[:players]
      team2_array.each do |player_name, data| 
          points2 += data[:points]
      end
    end
  end 
  if points1 > points2 
    return team1 
  else 
    return team2 
  end
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |location, team_data|
  players_array = team_data[:players]
    players_array.each do |player_name, data| 
      if player_name.size > longest_name.size
        longest_name = player_name
      end
    end 
  end 
  return longest_name
end 

#-------------------------------------------Super Bonus -----------------------------------------------------------

def long_name_steals_a_ton?
  longest_name = player_with_longest_name
  steals = 0 
  most_steals_by = ""
  game_hash.each do |location, team_data|
    players_array = team_data[:players]
    players_array.each do |player_name, data| 
      if data[:steals] > steals 
        steals = data[:steals]
        most_steals_by = player_name
      end
    end 
  end 
  if most_steals_by == longest_name 
    return true 
  else 
    return false 
  end 
end