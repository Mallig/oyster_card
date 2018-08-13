class Oystercard
attr_reader :balance

  def initialize (balance = 10)
    @balance = balance
  end

  def add_money(money)
    @balance += money
  end

end
