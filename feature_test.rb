require './lib/oystercard.rb'
card = Oystercard.new
card.balance
card.deduct_money(10)
card.touch_in
#card.touch_out
