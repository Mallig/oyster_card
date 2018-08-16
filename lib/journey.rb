class Journey
  attr_reader :current_journey, :journey, :history



  def initialize
    @journey = { entry: nil, exit: nil }
    @current_journey = false
    @history = []
  end

  def entry(station)
    @journey[:entry] = station
    @current_journey = true
  end

  def exit(station)
    @journey[:exit] = station
    @current_journey = false
    calculate_fare
    # records
  end

  def records
    @history << { entry: journey[:entry], exit: journey[:exit] }
    @journey[:entry] = nil
    @journey[:exit] = nil
  end

  def calculate_fare
    1
  end

  def penalty?
    journey[:entry] == nil || journey[:exit] == nil
  end

  def calculate_penalty

  end

  def in_journey?
    !!@journey[:entry]
  end

end
