require './lib/oystercard.rb'
card = Oystercard.new
card.add_money(50)
card.balance
card.deduct_money(5)