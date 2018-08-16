class Journey
  attr_reader :current_journey, :journey, :history



  def initialize
    @journey = { entry: nil, exit: nil }
    @history = []
  end

  def entry(station)
    @journey[:entry] = station
  end

  def exit(station)
    @journey[:exit] = station
    calculate_fare
  end

  def records
    @history << { entry: journey[:entry], exit: journey[:exit] }
    @journey[:entry] = nil
    @journey[:exit] = nil
  end

  def calculate_fare
    return 8 if penalty?
    1
  end

  def penalty? 
    journey[:entry] == nil # || journey[:exit] == nil
  end

end
