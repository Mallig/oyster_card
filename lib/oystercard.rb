class Oystercard
  DEFAULT_BALANCE = 10
  MINIMUM_FARE = 1
  attr_reader :balance, :limit

  def initialize (balance = DEFAULT_BALANCE)
    @balance = balance
    @limit = 90
    # @starting = nil
    @in_use = false
  end

  def add_money(amount)
    raise "balance limit reached: #{limit}" if (balance + amount) > limit
    @balance += amount
  end

  def deduct_money(amount)
    raise "Insufficient balance, #{balance} remaining" if (balance - amount) < 0
    @balance -= amount
  end

  def touch_in
    raise "Insufficient funds! Current balance: £#{balance}" if balance < MINIMUM_FARE
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

  def in_journey?
    @in_use
  end

end
