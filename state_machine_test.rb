require 'minitest'
require 'minitest/autorun'
require './state_machine'
require 'minitest/emoji'

class StateMachineTest < Minitest::Test
  def test_it_starts_off
    oven = Oven.new
    assert oven.off?
  end

  def test_baking_defaults_to_350
    oven = Oven.new
    oven = oven.bake
    assert oven.on?
    assert_equal 350, oven.target_temperature
  end

  def test_baking_temperature_up_once_goes_to_375
    oven = Oven.new
    oven = oven.bake
    oven = oven.temperature_up
    assert_equal 375, oven.target_temperature
  end

  def test_baking_temperature_up_twice_goes_to_400
    oven = Oven.new
    oven = oven.bake
    2.times{ oven = oven.temperature_up }
    assert_equal 400, oven.target_temperature
  end

  def test_baking_temperature_maxes_out_at_500
    oven = Oven.new
    oven = oven.bake
    6.times{ oven = oven.temperature_up }
    assert_equal 500, oven.target_temperature
    oven = oven.temperature_up
    assert_equal 500, oven.target_temperature
  end

  def test_baking_minimum_is_350
    oven = Oven.new
    oven = oven.bake
    assert_equal 350, oven.target_temperature
    oven = oven.temperature_down
    assert_equal 350, oven.target_temperature
  end

end
