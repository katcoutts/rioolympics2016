require('pg')
require_relative('../db/sql_runner.rb')

require_relative('./athlete.rb')
require_relative('./participation.rb')

class Event

  attr_reader :id, :name, :sport, :gold_id, :silver_id, :bronze_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @sport = options['sport']
    @gold_id = options['gold_id']
    @silver_id = options['silver_id']
    @bronze_id = options['bronze_id']
  end

  def save()
    sql = "INSERT INTO events (name, sport, gold_id, silver_id, bronze_id) VALUES ('#{ @name }', '#{@sport}', '#{@gold_id}', '#{@silver_id}', '#{@bronze_id}') RETURNING *"
    event = SqlRunner.run( sql ).first
    @id = event['id']
  end


  def athletes()
    sql = "SELECT a.* FROM athletes a INNER JOIN participations p on a.id = p.athlete_id WHERE p.event_id = #{@id};"
    return Athlete.map_items(sql)
  end

  def gold_medalist()
    sql = "SELECT * FROM athletes WHERE id = #{@gold_id}"
    return Athlete.map_item(sql)
  end

  def silver_medalist()
    sql = "SELECT * FROM athletes WHERE id = #{@silver_id}"
    return Athlete.map_item(sql)
  end

  def bronze_medalist()
    sql = "SELECT * FROM athletes WHERE id = #{@bronze_id}"
    return Athlete.map_item(sql)
  end

  def self.all()
    sql = "SELECT * FROM events"
    events = SqlRunner.run( sql )
    result = events.map { |e| Event.new( e ) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM events WHERE id = #{id}"
    event = SqlRunner.run(sql).first
    return Event.new(event)
  end

  def self.update(options)
    sql = "UPDATE events SET 
            name = '#{options['name']}', sport = '#{options['sport']}', gold_id = '#{options['gold_id']}', silver_id = '#{options['silver_id']}', bronze_id = '#{options['bronze_id']}'
            WHERE id = #{options['id']};"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM events WHERE id = #{id};"
    SqlRunner.run(sql)
  end 

  def self.delete_all()
    sql = "DELETE FROM events"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    events = SqlRunner.run(sql)
    result = events.map { |e| Event.new( e ) }
    return result
  end

  def self.map_item(sql)
    result = Event.map_items(sql)
    return result.first
  end


end


