class Oystercard
DEFAULT_CAPACITY = 10
attr_reader :balance, :limit

  def initialize (balance = DEFAULT_CAPACITY)
    @balance = balance
    @limit = 90
    # @starting = nil
    @in_use = false
  end

  def in_journey?
    @in_use
  end

  def add_money(amount)
    raise "balance limit reached: #{limit}" if (balance + amount) > limit
    @balance += amount
  end

  def deduct_money(amount)
    raise "Insufficient balance, #{balance} remaining" if (balance - amount) < 0
    @balance -= amount
  end

end
