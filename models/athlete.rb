require('pg')
require_relative('../db/sql_runner.rb')

require_relative('./nation.rb')
require_relative('./event.rb')
require_relative('./participation.rb')

class Athlete

attr_reader :first_name, :last_name, :id, :nation_id

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @nation_id = options['nation_id'].to_i
  end

  def save()
    sql = "INSERT INTO athletes (first_name, last_name, nation_id) VALUES ('#{ @first_name }', '#{ @last_name }','#{@nation_id}') RETURNING *"
    athlete = SqlRunner.run( sql ).first
    @id = athlete['id']
  end

  def nation()
    sql = "SELECT * FROM nations WHERE id = #{ @nation_id }"
    nation = SqlRunner.run( sql ).first
    result = Nation.new( nation ) 
    return result
  end

  def self.all()
    sql = "SELECT * FROM athletes"
    athletes = SqlRunner.run( sql )
    result = athletes.map { |a| Athlete.new( a ) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM athletes WHERE id = #{id}"
    athlete = SqlRunner.run(sql).first
    return Athlete.new(athlete)
  end

  def self.update(options)
    sql = "UPDATE athletes SET 
            first_name = '#{options['first_name']}', last_name = '#{options['last_name']}', nation_id = '#{options['nation_id']}'
            WHERE id = #{options['id']};"
    SqlRunner.run(sql)
  end
  
  def self.delete_all()
    sql = "DELETE FROM athletes"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM athletes WHERE id = #{id};"
    SqlRunner.run(sql)
  end 

  def self.map_items(sql)
    athletes = SqlRunner.run(sql)
    result = athletes.map { |a| Athlete.new( a ) }
    return result
  end

  def self.map_item(sql)
    result = Athlete.map_items(sql)
    return result.first
  end

  # def points()
  #   # NOT SURE THE BELOW IS THE RIGHT WAY TO WRITE THIS.
  #   points = (medals.totals['gold'] * 5) + (medals.totals['silver'] * 3) + medals.totals['bronze']
  # end

  # def league_points()
  #   points = (wins.count * 2) + draws.count
  #   return points
  # end

  # def gold_medals()
  #   gold_medals = 0
  #   events.each do |event|
  #     if event.gold_id.to_i == @id
  #       gold_medals += 1
  #     end
  #   end
  #   return gold_medals
  # end  

    def gold_medals()
    gold_medals = []
    events.each do |event|
      if event.gold_id.to_i == @id
        gold_medals << event
      end
    end
    return gold_medals
  end  

  # def silver_medals()
  #   silver_medals = 0
  #   events.each do |event|
  #     if event.silver_id.to_i == @id
  #       silver_medals += 1
  #     end
  #   end
  #   return silver_medals
  # end  

  def silver_medals()
    silver_medals = []
    events.each do |event|
      if event.silver_id.to_i == @id
        silver_medals << event
      end
    end
    return silver_medals
  end  

  # def bronze_medals()
  #   bronze_medals = 0
  #   events.each do |event|
  #     if event.bronze_id.to_i == @id
  #       bronze_medals += 1
  #     end
  #   end
  #   return bronze_medals
  # end  

  def bronze_medals()
    bronze_medals = []
    events.each do |event|
      if event.bronze_id.to_i == @id
        bronze_medals << event
      end
    end
    return bronze_medals
  end

    def events()
      sql = "SELECT e.* FROM events e INNER JOIN participations p on e.id = p.event_id WHERE p.athlete_id = #{@id};"
     return Event.map_items(sql)
    end


  end
















