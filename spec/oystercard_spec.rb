require 'oystercard'
describe Oystercard do
  context "when initialized" do
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

    describe "#add_money" do
      it "tops up the card" do
      # this test only checks the balance changes by 10, not if it's an increase or decrease
        expect { subject.add_money(10) }.to change { subject.balance }.by 10
      end
      it "will not top up over .limit" do
        expect { subject.add_money(81) }.to raise_error("balance limit reached: #{subject.limit}")
      end
    end
  end
end
