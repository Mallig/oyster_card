require './lib/oystercard.rb'
card = Oystercard.new
card.balance
#card.deduct_money(5)
card.touch_in("Camden")
card.touch_out
card.balance
