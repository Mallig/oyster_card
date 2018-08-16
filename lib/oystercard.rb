class Oystercard
  DEFAULT_BALANCE = 10
  MINIMUM_FARE = 1
  attr_reader :balance, :limit, :journey, :journey_history

  def initialize (balance = DEFAULT_BALANCE)
    @balance = balance
    @limit = 90
    @journey = { entry: nil, exit: nil }
    @journey_history = []
  end

  def add_money(amount)
    raise "balance limit reached: #{limit}" if (balance + amount) > limit
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient funds! Current balance: £#{balance}" if balance < MINIMUM_FARE
    @journey[:entry] = station
  end

  def touch_out(station)
    deduct_money(MINIMUM_FARE)
    @journey[:exit] = station
    @journey_history << @journey
    @journey[:entry] = nil
    @journey[:exit] = nil
  end

  def print_journey_history
    trip = ""
    @journey_history.each { |hash| trip.concat("Started at #{hash[:entry]}, ended at #{hash[:exit]}\n")}
    trip
  end


  def in_journey?
    !!@journey[:entry]
  end

  private
  def deduct_money(amount)
    raise "Insufficient balance, #{balance} remaining" if (balance - amount) < 0
    @balance -= amount
  end
end
