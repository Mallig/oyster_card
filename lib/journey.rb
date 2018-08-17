class Journey
  attr_reader :current_journey, :history
  attr_accessor :journey



  def initialize
    @journey = { entry: nil, exit: nil }
    @history = []
  end

  def entry(station)
    journey[:entry] = station
  end

  def exit(station)
    journey[:exit] = station
  end

  def records
    @history << { entry: journey[:entry], exit: journey[:exit] }
    journey[:entry] = nil
    journey[:exit] = nil
  end

end
