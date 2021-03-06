require('pg')
require_relative('../db/sql_runner.rb')

require_relative('./athlete.rb')
require_relative('./participation.rb')

class Event

  attr_reader :id, :name, :sport

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @sport = options['sport']
  end

  def save()
    sql = "INSERT INTO events (name, sport) VALUES ('#{ @name }', '#{@sport}') RETURNING *"
    event = SqlRunner.run( sql ).first
    @id = event['id']
  end

  def athletes()
    sql = "SELECT a.* FROM athletes a INNER JOIN participations p on a.id = p.athlete_id WHERE p.event_id = #{@id} ORDER BY p.position;"
    return Athlete.map_items(sql)
  end

  def results()
    sql = "SELECT athletes.first_name, athletes.last_name, participations.position FROM athletes INNER JOIN participations on athletes.id = participations.athlete_id WHERE participations.event_id = #{@id};"
    result = SqlRunner.run(sql)
    ordered_results = result.sort_by { |k| k["position"].to_i }
    return ordered_results
  end

  def self.all()
    sql = "SELECT * FROM events ORDER BY events.sport"
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
    name = '#{options['name']}', sport = '#{options['sport']}'
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


