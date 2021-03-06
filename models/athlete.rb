require('pg')
require_relative('../db/sql_runner.rb')

require_relative('./nation.rb')
require_relative('./event.rb')
require_relative('./participation.rb')

class Athlete

  # class of athlete. Each athlete has to have first name and last name (this will allow them to be ordered alphabetically). 
  # they need to have a nation-id to allow them to be linked to one of the nations.
  # they need to be given an id which will be used in participations as a way of linking an athlete to an event.









  attr_reader :first_name, :last_name, :id, :nation_id, :image

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @nation_id = options['nation_id'].to_i
    @image = options['image']
  end

  def save()
    sql = "INSERT INTO athletes (first_name, last_name, nation_id, image) VALUES ('#{ @first_name }', '#{ @last_name }','#{@nation_id}', '#{@image}') RETURNING *"
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
    first_name = '#{options['first_name']}', last_name = '#{options['last_name']}', nation_id = '#{options['nation_id']}', nation_image = '#{options['nation_image']}'
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

  def participations
    sql = "SELECT participations.* FROM participations WHERE participations.athlete_id = #{@id}"
    participations = Participation.map_items(sql)
  end



  def gold_medals
    gold_medals = []
    participations.each do |participation|
      if participation.position == 1
        gold_medals << participation
      end
    end
    return gold_medals
  end  



  def silver_medals
    silver_medals = []
    participations.each do |participation|
      if participation.position == 2
        silver_medals << participation
      end
    end
    return silver_medals
  end 



  def bronze_medals
    bronze_medals = []
    participations.each do |participation|
      if participation.position == 3
        bronze_medals << participation
      end
    end
    return bronze_medals
  end



  def events()
    sql = "SELECT e.* FROM events e INNER JOIN participations p on e.id = p.event_id WHERE p.athlete_id = #{@id};"
    return Event.map_items(sql)
  end

  def gold_events()
    sql = "SELECT e.* FROM events e INNER JOIN participations p on e.id = p.event_id WHERE p.athlete_id = #{@id} AND p.position = 1;"
    return Event.map_items(sql)
  end

  def silver_events()
    sql = "SELECT e.* FROM events e INNER JOIN participations p on e.id = p.event_id WHERE p.athlete_id = #{@id} AND p.position = 2;"
    return Event.map_items(sql)
  end

  def bronze_events()
    sql = "SELECT e.* FROM events e INNER JOIN participations p on e.id = p.event_id WHERE p.athlete_id = #{@id} AND p.position = 3;"
    return Event.map_items(sql)
  end

  def non_placing_events()
    sql = "SELECT e.* FROM events e INNER JOIN participations p on e.id = p.event_id WHERE p.athlete_id = #{@id} AND p.position >= 4;"
    return Event.map_items(sql)
  end

  def positions
    sql = "SELECT events.name, participations.position FROM events INNER JOIN participations on events.id = participations.event_id WHERE participations.athlete_id = #{@id};"
    result = SqlRunner.run(sql)
    return result
  end



  def points()
    total = 0
    total += (gold_medals.count * 5) + (silver_medals.count * 3) + bronze_medals.count
    return total
  end

 

end


# def gold_medals_count()
#   gold_medals = 0
#   events.each do |event|
#     if event.gold_id.to_i == @id
#       gold_medals += 1
#     end
#   end
#   return gold_medals
# end  

# def gold_medals()
#   gold_medals = []
#   events.each do |event|
#     if event.gold_id.to_i == @id
#       gold_medals << event
#     end
#   end
#   return gold_medals
# end  

# def silver_medals_count()
#   silver_medals = 0
#   events.each do |event|
#     if event.silver_id.to_i == @id
#       silver_medals += 1
#     end
#   end
#   return silver_medals
# end  

# def silver_medals()
#   silver_medals = []
#   events.each do |event|
#     if event.silver_id.to_i == @id
#       silver_medals << event
#     end
#   end
#   return silver_medals
# end  

# def bronze_medals_count()
#   bronze_medals = 0
#   events.each do |event|
#     if event.bronze_id.to_i == @id
#       bronze_medals += 1
#     end
#   end
#   return bronze_medals
# end  

# def bronze_medals()
#   bronze_medals = []
#   events.each do |event|
#     if event.bronze_id.to_i == @id
#       bronze_medals << event
#     end
#   end
#   return bronze_medals
# end

# def gold_medals_count()
#   gold_medals = 0
#   participations.each do |participation|
#     if participation.position == 1
#       gold_medals += 1
#     end
#   end
#   return gold_medals
# end 


# def silver_medals_count()
#   silver_medals = 0
#   participations.each do |participation|
#     if participation.position == 1
#       silver_medals += 1
#     end
#   end
#   return silver_medals
# end  


# def bronze_medals_count()
#   bronze_medals = 0
#   participations.each do |participation|
#     if participation.position == 1
#       bronze_medals += 1
#     end
#   end
#   return bronze_medals
# end 










