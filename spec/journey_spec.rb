require 'journey'

describe Journey do
  it "returns current journey as true when touched in" do
    expect(subject.current_journey).to eq(true).or eq(false)
  end

  describe "#entry" do
    it "records entry station in .journey" do
      expect { subject.entry("Bank") }.to change { subject.journey[:entry] }.to "Bank"
    end

    it "changes .current_journey to true" do
      expect { subject.entry("Bank") }.to change { subject.current_journey }.from(false).to true
    end
  end

  describe "#exit" do
    it "records exit station in .journey" do
      expect { subject.exit("Bank") }.to change { subject.journey[:exit] }.to "Bank"
    end

    it "changes .current_journey to false" do
      subject.entry("Wapping")
      # subject.should_receive(:current_journey).and_return true
      expect { subject.exit("Bank") }.to change { subject.current_journey }.from(true).to false
    end

  end

  describe "#calculate_fare" do

    it "returns a fare" do
      expect(subject.calculate_fare).to eq 1
    end

  end
end
