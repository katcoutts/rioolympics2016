require('minitest/autorun')
require('minitest/rg')

require_relative('../models/athlete.rb')

class TestAthlete < MiniTest::Test

  def setup
    @athlete = Athlete.new({"name" => "Usain Bolt", "nation_id" => 4})
  end

  def test_name
    assert_equal("Usain Bolt", @athlete.name)
  end
end