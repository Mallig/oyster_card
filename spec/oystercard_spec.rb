require 'oystercard'
describe Oystercard do
  describe "when initialized" do
    it { is_expected.not_to eql(nil) }

    it "responds to :money" do
      expect(subject).to respond_to(:add_money)
    end

    it "has a balance of 10" do
      expect(subject.balance).to eq(Oystercard::DEFAULT_CAPACITY)
    end

    it "has a changeable default balance" do
      expect(Oystercard.new(5).balance).to eq(5)
    end
  end

  describe "#add_money" do
    it "tops up the card" do
      expect { subject.add_money(10) }.to change { subject.balance }.by +10
    end
    it "will not top up over .limit" do
      expect { subject.add_money(subject.limit+1) }.to raise_error("balance limit reached: #{subject.limit}")
    end
  end

  describe "#deduct_money" do
    it { is_expected.to respond_to(:deduct_money).with(1).argument }
    it "deducts amount from card balance" do
      expect { subject.deduct_money(5) }.to change { subject.balance }.by -5 
    end
  
    it "will not deduct more than balance" do
      expect { subject.deduct_money(Oystercard::DEFAULT_CAPACITY+1) }.to raise_error("Insufficient balance, #{subject.balance} remaining")
    end
  end
end
