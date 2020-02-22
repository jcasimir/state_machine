class OvenBake < Oven
  attr_reader :target_temperature

  def default_baking_temperature
    350
  end

  def initialize
    @currently_heating = true
    @target_temperature = default_baking_temperature
  end

  def temperature_up
    OvenBake375.new
  end

  def temperature_down
    self
  end
end

class OvenBake375 < OvenBake
  def initialize
    @target_temperature = 375
  end

  def temperature_up
    OvenBake400.new
  end
end

class OvenBake400 < OvenBake
  def initialize
    @target_temperature = 400
  end

  def temperature_up
    OvenBake425.new
  end
end

class OvenBake425 < OvenBake
  def initialize
    @target_temperature = 425
  end

  def temperature_up
    OvenBake450.new
  end
end

class OvenBake450 < OvenBake
  def initialize
    @target_temperature = 450
  end

  def temperature_up
    OvenBake475.new
  end
end

class OvenBake475 < OvenBake
  def initialize
    @target_temperature = 475
  end

  def temperature_up
    OvenBake500.new
  end
end

class OvenBake500 < OvenBake
  def initialize
    @target_temperature = 500
  end

  def temperature_up
    self
  end

  def temperature_down
    OvenBake475.new
  end
end
