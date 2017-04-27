def game_hash
  {
    home: {
      team_name: 'Brooklyn Nets',
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
          },
        "Reggie Evans" => {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
          },
          "Brook Lopez" => {
            player_name: "Brook Lopez",
            number: 11,
            shoe: 17,
            points: 17,
            rebounds: 19,
            assists: 10,
            steals: 3,
            blocks: 1,
            slam_dunks: 15
            },
        "Mason Plumlee" => {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
          },
        "Jason Terry" => {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        },
      },
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          player_name: "Brendan Haywood",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }#end player,
      }#end players
    }#end away
  }#end game hash
end

def num_points_scored(player_name)
  my_game = game_hash
  my_game.each do |team, basic_info|
    basic_info[:players].each do |name, stats|
      if name.to_s == player_name
        return stats[:points]
      end
    end
  end
end

def shoe_size(player_name)
  my_game = game_hash
  my_game.each do |team, basic_info|
    basic_info[:players].each do |name, stats|
      if name.to_s == player_name
        return stats[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  my_game = game_hash
  my_team = ""
  my_game.each do |team, basic_info_hash|
    basic_info_hash.each do |key, value|
      if value == team_name
        my_team = team
      end
    end
  end
  my_game[my_team][:colors]
end

def team_names
  my_game = game_hash
  return [my_game[:home][:team_name], my_game[:away][:team_name]]
end

def player_numbers(team_name)
  my_game = game_hash
  jerseys = []
  my_team = ""
  my_game.each do |team, basic_info_hash|
   basic_info_hash.each do |key, value|
      if value == team_name
        my_team = team
      end
    end
  end
  my_game[my_team][:players].each do |players, player|
    jerseys << player[:number]
  end
  jerseys
end

def all_players
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  all_players = home_players.merge(away_players)
end

def player_stats_list
  player_stats_list = []
  all_players.each do |name, stats|
    player_stats_list << stats
  end
  player_stats_list
end

def player_stats(name)
  player_stats_list.map do |e|
    if e[:player_name] == name
      e.delete(:player_name)
      return e
    end
  end
end

def big_shoe_rebounds
  size = 0
  name = ''
  rebounds = 0
  player_stats_list.each do |e|
    e.each do |key, value|
      if e[:shoe] > size
        size = e[:shoe]
        name = e[:player_name]
        rebounds = e[:rebounds]
      end
    end
  end
  return rebounds
end
