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
    sql = "SELECT * FROM atletes WHERE id = #{id}"
    athlete = SqlRunner.run(sql).first
    return Athlete.new(athlete)
  end

  def self.update(options)
    sql = "UPDATE athletes SET 
            name = '#{options['name']}', nation_id = '#{options['nation_id']}'
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

  def points
  end

  def medals
  end

  def events
  end

end
