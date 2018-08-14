require './lib/oystercard.rb'
card = Oystercard.new
card.balance
#card.deduct_money(5)
card.touch_in("Camden")
card.journey
card.touch_out
card.journey_history