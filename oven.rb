class Oven
  attr_reader :currently_heating

  def initialize
    @currently_heating = false
  end

  def off?
    !currently_heating
  end

  def on?
    !off?
  end

  def bake
    OvenBake.new
  end
end
