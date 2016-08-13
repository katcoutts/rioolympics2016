require('minitest/autorun')
require('minitest/rg')

require_relative('../models/event.rb')

class TestEvent < MiniTest::Test

  def setup
    @event = Event.new({"name" => "100m sprint - men", "sport" => "athletics", "gold_id" => 4, "silver_id" => 5, "bronze_id" => 3})
  end

  def test_has_a_name
    assert_equal("100m sprint - men", @event.name)
  end

  def test_has_a_sport
    assert_equal("athletics", @event.sport)
  end

end