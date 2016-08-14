require('minitest/autorun')
require('minitest/rg')

require_relative('../models/athlete.rb')

class TestAthlete < MiniTest::Test

  def setup
    @athlete = Athlete.new({"first_name" => "Usain", "last_name" => "Bolt", "nation_id" => 4})
  end

  def test_has_first_name
    assert_equal("Usain", @athlete.first_name)
  end

  def test_has_last_name
    assert_equal("Bolt", @athlete.last_name)
  end
end