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

  describe "#records" do

    before(:each) do
      subject.entry("Waterloo")
      subject.exit("Bank")
      subject.records
    end

    it "logs the journey" do
      expect(subject.history).to eq [{ entry: "Waterloo", exit: "Bank" }] 
    end

    it "resets journey" do
      expect(subject.journey).to eq( {entry: nil, exit: nil } )
    end

  end

end
