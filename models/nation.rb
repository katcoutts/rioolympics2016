require('pg')
require_relative('../db/sql_runner.rb')

require_relative('./athlete.rb')

class Nation

  attr_reader :name, :id, :flag

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @flag = options['flag']
  end

  def save()
    sql = "INSERT INTO nations (name, flag) VALUES ('#{ @name }', '#{ @flag }') RETURNING *"
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
    return Nation.new(nation)
  end

  def self.update(options)
    sql = "UPDATE nations SET 
    name = '#{options['name']}',
    flag = '#{options['flag']}'
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

  def nation_points
    nation_points = 0
    athletes.each do |athlete|
      nation_points += athlete.points
    end
    return nation_points
  end

  def nation_gold_medals
    gold_medal_count = []
    athletes.each do |athlete|
      if athlete.gold_medals != []
        gold_medal_count << athlete.gold_medals
      end
    end
    return gold_medal_count
  end

  def nation_silver_medals
    silver_medal_count = []
    athletes.each do |athlete|
      if athlete.silver_medals != []
        silver_medal_count << athlete.silver_medals
      end
    end
    return silver_medal_count
  end

  def nation_bronze_medals
    bronze_medal_count = []
    athletes.each do |athlete|
      if athlete.bronze_medals != []
        bronze_medal_count << athlete.bronze_medals
      end
    end
    return bronze_medal_count
  end

  

  # def events
  # end

end



