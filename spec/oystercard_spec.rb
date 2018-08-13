require 'oystercard'
describe Oystercard do
  context "when initialized" do
    it { is_expected.not_to eql(nil) }
    it "responds to :money" do
      expect(subject).to respond_to(:add_money)
    end
    it "has a balance of 10" do
      expect(subject.balance).to eq(10)
    end
    it "has a changeable default balance" do
      expect(Oystercard.new(5).balance).to eq(5) 
    end
  end
end
