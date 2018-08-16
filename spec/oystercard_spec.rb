require 'oystercard'
require 'rspec/its'

describe Oystercard do

  let(:station_double) { double :station }
  
  describe "when initialized" do
    its("balance") { is_expected.to eq(Oystercard::DEFAULT_BALANCE) }
    it { is_expected.not_to eql(nil) }

    it "responds to :money" do
      expect(subject).to respond_to(:add_money)
    end

    #it "has a default balance" do
    #  expect(subject.balance).to eq(Oystercard::DEFAULT_BALANCE)
    #end

    it "has a changeable default balance" do
      expect(Oystercard.new(5).balance).to eq(5)
    end
  end

  describe "#add_money" do
    it { is_expected.to respond_to(:add_money).with(1).argument }

    it "tops up the card" do
      expect { subject.add_money(10) }.to change { subject.balance }.by +10
    end
    it "will not top up over .limit" do
      expect { subject.add_money(subject.limit+1) }.to raise_error("balance limit reached: #{subject.limit}")
    end
  end

  describe "#deduct_money" do

    it "deducts amount from card balance" do
      expect { subject.send :deduct_money, 5 }.to change { subject.balance }.by -5
    end

    it "will not deduct more than balance" do
      expect { subject.send :deduct_money, (Oystercard::DEFAULT_BALANCE+1) }.to raise_error("Insufficient balance, #{subject.balance} remaining")
    end
  end

  describe "#touch_in" do
    it { is_expected.to respond_to(:touch_in).with(1).argument }
    it "changes value of .in_use to true" do
      expect { subject.touch_in(station_double) }.to change { subject.in_journey? }.from(false).to true
    end

    it "will raise error if tap below minimum limit" do
      subject.send :deduct_money, Oystercard::DEFAULT_BALANCE
      expect { subject.touch_in(station_double) }.to raise_error("Insufficient funds! Current balance: £#{subject.balance}")
    end

    it "will log the journey starting location" do
      expect { subject.touch_in(station_double) }.to change { subject.journey[:entry] }.to station_double
    end

  end

  describe "#touch_out" do
    it "changes value of #in_use to false" do
      subject.touch_in(station_double)
      expect { subject.touch_out(station_double) }.to change { subject.in_journey? }.from(true).to false
    end

    it "will charge balance minimum fare" do
      subject.touch_in(station_double)
      expect { subject.touch_out(station_double) }.to change { subject.balance }.by -Oystercard::MINIMUM_FARE
    end

    it "will log the journey in .journey_history" do
      subject.touch_in(station_double)
      subject.touch_out(station_double)
      expect(subject.journey_history.last).to eq( { entry: station_double, exit: station_double } )
    end
  end

  describe "#print_journey_history" do
    it "returns cards journey history" do
      subject.touch_in(station_double)
      subject.touch_out(station_double)
      expect(subject.journey_history).to eq([{ entry: station_double, exit: station_double }])
    end

#    it "" do
#
#    end
  end
end
