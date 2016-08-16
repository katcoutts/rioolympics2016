require('pg')
require_relative('../db/sql_runner.rb')


class Participation

  attr_reader :id, :athlete_id, :event_id, :position

  def initialize( options )
    @id = options['id'].to_i
    @athlete_id = options['athlete_id'].to_i
    @event_id = options['event_id'].to_i
    @position = options['position'].to_i
  end

  def save()
    sql = "INSERT INTO participations (athlete_id, event_id, position) VALUES (#{@athlete_id}, #{@event_id}, #{@position}) RETURNING *"
    participation = SqlRunner.run(sql).first
    @id = participation['id']
  end

  def athlete()
    sql = "SELECT * FROM athletes WHERE id = #{@athlete_id}"
    return Athlete.map_item(sql)
  end

  def event()
    sql = "SELECT * FROM events WHERE id = #{@event_id}"
    return Event.map_item(sql)
  end

  def self.all()
    sql = "SELECT * FROM participations"
    return Participation.map_items(sql)
  end

  def self.update(options)
    sql = "UPDATE participations SET 
    athlete_id = '#{options['athlete_id']}', event_id = '#{options['event_id']}', position = '#{options['position']}'
    WHERE id = #{options['id']};"
    SqlRunner.run(sql)
  end


  def self.find(id)
    sql = "SELECT * FROM participations WHERE id = #{id}"
    participation = SqlRunner.run(sql).first
    return Participation.new(participation)
  end

  def self.delete_all()
    sql = "DELETE FROM participations"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM participations WHERE id = #{id};"
    SqlRunner.run(sql)
  end 

  def self.map_items(sql)
    participations = SqlRunner.run(sql)
    result = participations.map { |p| Participation.new( p ) }
    return result
  end

  def self.map_item(sql)
    result = Participation.map_items(sql)
    return result.first
  end



end
