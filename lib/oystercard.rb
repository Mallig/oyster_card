class Oystercard
  DEFAULT_BALANCE = 10
  MINIMUM_FARE = 1
  attr_reader :balance, :limit, :journey

  def initialize (balance = DEFAULT_BALANCE)
    @balance = balance
    @limit = 90
    # @starting = nil
    @journey = false
  end

  def add_money(amount)
    raise "balance limit reached: #{limit}" if (balance + amount) > limit
    @balance += amount
  end

  def touch_in(barrier)
    raise "Insufficient funds! Current balance: £#{balance}" if balance < MINIMUM_FARE
    @journey = barrier
  end

  def touch_out
    deduct_money(MINIMUM_FARE)
    @journey = false
  end

  def in_journey?
    !!@journey
  end

  private
  def deduct_money(amount)
    raise "Insufficient balance, #{balance} remaining" if (balance - amount) < 0
    @balance -= amount
  end
end
