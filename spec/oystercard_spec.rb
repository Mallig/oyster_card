require 'oystercard'
require 'rspec/its'

describe Oystercard do

  let(:station_double) { double :station, zone: 1 }
  let(:zone1_station_double) { double :station, zone: 1}
  let(:zone2_station_double) { double :station, zone: 2}
  let(:zone3_station_double) { double :station, zone: 3}


  describe "when initialized" do
    its("balance") { is_expected.to eq(Oystercard::DEFAULT_BALANCE) }
    it { is_expected.not_to eql(nil) }

    it "responds to :money" do
      expect(subject).to respond_to(:add_money)
    end

    it "has a default balance" do
      expect(subject.balance).to eq(Oystercard::DEFAULT_BALANCE)
    end

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
      subject.touch_in(station_double)
      subject.touch_out(station_double)
      expect { subject.send :deduct_money }.to change { subject.balance }.by -1
    end

  end

  describe "#touch_in" do
    it { is_expected.to respond_to(:touch_in).with(1).argument }

    it "will raise error if tap below minimum limit" do
      subject = Oystercard.new(0)
      expect { subject.touch_in(station_double) }.to raise_error("Insufficient funds! Current balance: £#{subject.balance}")
    end

  end

  describe "#touch_out" do

    context "when travelling within a zone" do

      it "will charge balance minimum fare" do
        subject.touch_in(station_double)
        expect { subject.touch_out(station_double) }.to change { subject.balance }.by -Oystercard::MINIMUM_FARE
      end

    end

    context "when travelling between zones" do

      it "will charge minimum fare plus £1 per zone change" do
        subject.touch_in(zone1_station_double)
        expect { subject.touch_out(zone2_station_double) }.to change { subject.balance }.by ( -Oystercard::MINIMUM_FARE - 1 )
      end

    end



  end


end
