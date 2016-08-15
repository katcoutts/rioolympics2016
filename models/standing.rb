require('pry-byebug')

require_relative('./athlete.rb')
require_relative('./nation.rb')
require_relative('./event.rb')
require_relative('./participation.rb')



class Standing

  attr_reader :events, :nations, :participations, :athletes

  def initialize()
    @events = Event.all
    @nations = Nation.all
    @participations = Participation.all
    @athletes = Athlete.all
  end

  def order_by_points()
    nation_points = []
    @nations.each do |nation|
      nation_points << ({name: nation.name, gold_medals: nation.nation_gold_medals.count, silver_medals: nation.nation_silver_medals.count, bronze_medals: nation.nation_bronze_medals.count, points: nation.nation_points})
    end
    sorted = nation_points.sort_by { |k| k[:points]}
    return sorted.reverse
  end

end

# binding.pry
# nil

#   def team_positions()
#     team_points = []
#     @teams.each do |team|
#       team_points << ({name: team.name, points: team.league_points})
#     end
#     sorted = team_points.sort_by { |k| k[:points]}
#     return sorted.reverse
#   end

#   def league_topper()
#     team_positions.first
#   end

# # NB NEED TO ADD IN SOMETHING HERE THAT WOULD TAKE INTO ACCOUNT POINTS DIFFERENCE IF MULTIPLE TEAMS HAVE THE SAME NUMBER OF LEAGUE POINTS.

#   def league_table_info()
#     league_table = []
#     @teams.each do |team|
#       league_table << ({position: table_position(team), name: team.name, wins: team.wins.count, losses: team.losses.count, draws: team.draws.count, points_for: team.total_points_scored, points_against: team.total_points_conceded, points_difference: team.points_difference, league_points: team.league_points})
#     end
#     sorted = league_table.sort_by { |k| k[:league_points]}
#     return sorted.reverse
#   end

