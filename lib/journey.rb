class Journey
  attr_reader :current_journey, :journey

  def initialize
    @journey = { entry: nil, exit: nil }
    @current_journey = false
  end

  def entry(station)
    @journey[:entry] = station
    @current_journey = true
  end
  
  def exit(station)
    @journey[:exit] = station
    @current_journey = false
  end

  def calculate_fare

  end

  def penalty?

  end

  def calculate_penalty

  end

  def touch_in(station)
    raise "Insufficient funds! Current balance: £#{balance}" if balance < MINIMUM_FARE
    @journey[:entry] = station
  end

  def touch_out(station)
    deduct_money(MINIMUM_FARE)
    @journey[:exit] = station
    @journey_history << { entry: journey[:entry], exit: journey[:exit] }
    @journey[:entry] = nil
    @journey[:exit] = nil
  end

  def in_journey?
    !!@journey[:entry]
  end
  
end