require 'journey'

describe Journey do

  describe "#entry" do

    it "records entry station in .journey" do
      expect { subject.entry("Bank") }.to change { subject.journey[:entry] }.to "Bank"
    end

  end

  describe "#exit" do

    it "records exit station in .journey" do
      expect { subject.exit("Bank") }.to change { subject.journey[:exit] }.to "Bank"
    end

  end

  describe "#calculate_fare" do

    it "returns a fare" do
      expect(subject.calculate_fare).to eq 1
    end

  end

  describe "#records" do

    before(:each) do
      subject.entry("Waterloo")
      subject.exit("Bank")
    end

    it "logs the journey" do
      expect(subject.history).to eq [{ entry: "Waterloo", exit: "Bank" }] 
    end

    it "resets journey" do

    end

  end

  describe "#calculate_fare" do

    it "charges a penalty" do

    end

    it "charges a fare" do

    end

  end

  describe "#penalty?" do
    
    it "checks if a penalty should be applied" do

    end

  end

end
