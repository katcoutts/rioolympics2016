require('minitest/autorun')
require('minitest/rg')

require_relative('../models/nation.rb')

class TestNation < MiniTest::Test

  def setup
    @nation = Nation.new({"name" => "Great Britain"})
  end

  def test_name
    assert_equal("Great Britain", @nation.name)
  end
end