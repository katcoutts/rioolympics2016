require('pg')
require_relative('../db/sql_runner.rb')

require_relative('./athlete.rb')

class Nation

attr_reader :name, :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO nations (name) VALUES ('#{ @name }') RETURNING *"
    nation = SqlRunner.run( sql ).first
    @id = nation['id']
  end

  def athletes()
    sql = "SELECT * FROM athletes WHERE nation_id = #{ @id }"
    athletes = SqlRunner.run( sql )
    result = athletes.map { |a| Athlete.new( a ) }
    return result
  end

  def self.all()
    sql = "SELECT * FROM nations"
    nations = SqlRunner.run( sql )
    result = nations.map { |n| Nation.new( n ) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM nations WHERE id = #{id}"
    nation = SqlRunner.run(sql).first
    return Nation.new(album)
  end

  def self.update(options)
    sql = "UPDATE nations SET 
            name = '#{options['name']}'
            WHERE id = #{options['id']};"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM nations WHERE id = #{id};"
    SqlRunner.run(sql)
  end 

  def self.delete_all()
    sql = "DELETE FROM nations"
    SqlRunner.run(sql)
  end

  def points
  end

  def medals
  end

  def events
  end

end



