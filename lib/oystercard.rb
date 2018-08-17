#require_relative 'journey.rb'

class Oystercard
  DEFAULT_BALANCE = 10
  MINIMUM_FARE = 1
  MAXIMUM_FARE = 8
  attr_reader :balance, :limit, :journey_log

  def initialize (balance = DEFAULT_BALANCE, journey_log = JourneyLog.new)
    @balance = balance
    @limit = 90
    @journey_log = journey_log
  end

  def add_money(amount)
    raise "balance limit reached: #{limit}" if (balance + amount) > limit
    @balance += amount
  end

  def touch_in(station)
    deduct_penalty if penalty_on_entry?
    raise "Insufficient funds! Current balance: £#{balance}" if balance < MINIMUM_FARE
    journey_log.entry(station)
  end

  def touch_out(station)
    deduct_penalty if penalty_on_exit?
    journey_log.exit(station)
    deduct_money
  end

  
  private
  def calculate_fare
    MINIMUM_FARE
  end

  def penalty_on_exit? 
    journey_log.journey[:entry] == nil
  end
  
  def penalty_on_entry?
    journey_log.journey[:exit] == nil && journey_log.journey[:entry] == true
  end

  def deduct_money
    amount = calculate_fare
    @balance -= amount
  end

  def deduct_penalty
    @balance -= MAXIMUM_FARE
  end


end
