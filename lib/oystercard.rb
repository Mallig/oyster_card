#require_relative 'journey.rb'

class Oystercard
  DEFAULT_BALANCE = 10
  MINIMUM_FARE = 1
  attr_reader :balance, :limit, :journey

  def initialize (balance = DEFAULT_BALANCE, journey = Journey.new)
    @balance = balance
    @limit = 90
    @journey = journey
  end

  def add_money(amount)
    raise "balance limit reached: #{limit}" if (balance + amount) > limit
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient funds! Current balance: £#{balance}" if balance < MINIMUM_FARE
    journey.entry(station)
  end

  def touch_out(station)
    journey.exit(station)
    journey.records
    deduct_money
  end

  private
  def deduct_money
    amount = journey.calculate_fare
    # raise "Insufficient balance, #{balance} remaining" if (balance - amount) < 0
    @balance -= amount
  end


end
