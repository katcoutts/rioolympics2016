require('pg')
require_relative('../db/sql_runner.rb')

require_relative('./nation.rb')
require_relative('./event.rb')
require_relative('./participation.rb')

class Nation

attr_reader :name, :id, :nation_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @nation_id = options['nation_id'].to_i
  end

  def save()
    sql = "INSERT INTO athletes (name, nation_id) VALUES ('#{ @name }', '#{@nation_id}') RETURNING *"
    athlete = SqlRunner.run( sql ).first
    @id = athlete['id']
  end

  # def nation()
  #   sql = "SELECT * FROM nations WHERE id = #{ @nation_id }"
  #   nation = SqlRunner.run( sql ).first
  #   result = Nation.new( nation ) 
  #   return result
  # end

  # def self.all()
  #   sql = "SELECT * FROM athletes"
  #   athletes = SqlRunner.run( sql )
  #   result = athletes.map { |a| Athlete.new( a ) }
  #   return result
  # end

  # def self.find(id)
  #   sql = "SELECT * FROM atletes WHERE id = #{id}"
  #   athlete = SqlRunner.run(sql).first
  #   return Athlete.new(athlete)
  # end

  # def self.update(options)
  #   sql = "UPDATE athletes SET 
  #           name = '#{options['name']}', nation_id = '#{options['nation_id']}'
  #           WHERE id = #{options['id']};"
  #   SqlRunner.run(sql)
  # end
  
  def self.delete_all()
    sql = "DELETE FROM athletes"
    SqlRunner.run(sql)
  end

  # def self.destroy(id)
  #   sql = "DELETE FROM athletes WHERE id = #{id};"
  #   SqlRunner.run(sql)
  # end 

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

  # def medals()
  #   totals = { 'gold' => 0, 'silver' => 0, 'bronze' => 0}
  #   events.each do |event|
  #       if event.gold_id == @id
  #         medals['gold'] += 1
  #       elsif event.silver_id == @id
  #         medals['silver'] += 1
  #       elsif bronze_id == @id
  #         medals['bronze_id'] += 1
  #       end
  #     end
  #     return totals
  #   end

  #   def events()
  #     sql = "SELECT e.* FROM events e INNER JOIN participations p on e.id = p.event_id WHERE p.athlete_id = #{@id};"
  #   # COULD BE JUST ONE THING RETURNED HERE OR COULD BE MORE SO NOT SURE WHETHER MAP_ITEMS OR MAP_ITEM????
  #    return Event.map_items(sql)
  #   end


  end
















