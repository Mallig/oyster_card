require './lib/oystercard.rb'
card = Oystercard.new
card.balance
card.deduct_money(5)
card.in_journey?
