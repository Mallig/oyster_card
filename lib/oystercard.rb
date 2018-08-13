class Oystercard
DEFAULT_CAPACITY = 10
attr_reader :balance, :limit

  def initialize (balance = DEFAULT_CAPACITY)
    @balance = balance
    @limit = 90
  end

  def add_money(money)
    raise "balance limit reached: #{limit}" if (balance + money) > limit
    @balance += money
  end

end
