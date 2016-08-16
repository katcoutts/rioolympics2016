require('pry-byebug')
require('table_print')

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
      nation_points << ({name: nation.name, gold_medals: nation.nation_gold_medals.count, silver_medals: nation.nation_silver_medals.count, bronze_medals: nation.nation_bronze_medals.count, points: nation.nation_points, id: nation.id, flag: nation.flag})
    end
    sorted = nation_points.sort_by { |k| [k[:points],
      k[:gold_medals],
      k[:silver_medals],
      k[:bronze_medals]]}

      return sorted.reverse
    end


  end

# BELOW IS ANOTHER WAY OF SORTING BY MULTIPLE THINGS WHICH IS WORKING.
# sorted = nation_points.sort { |a, b| [a[:points], a[:gold_medals], a[:silver_medals], a[:bronze_medals]] <=> [b[:points], b[:gold_medals], b[:silver_medals], b[:bronze_medals]] }


# binding.pry
# nil

