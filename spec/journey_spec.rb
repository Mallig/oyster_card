require 'journey'

describe Journey do

  describe "#entry" do

    it "records entry station in .journey" do
      expect { subject.entry("Bank") }.to change { subject.journey[:entry] }.to "Bank"
    end

  end

  describe "#exit" do

    it "logs the journey in .history" do
      subject.exit("Bank")
      expect(subject.history).to include( { entry: nil, exit: "Bank" } )
    end

  end

  describe "#records" do

    before(:each) do
      subject.entry("Waterloo")
      subject.exit("Bank")
      subject.records
    end

    it "logs the journey" do
      expect(subject.history).to include( { entry: "Waterloo", exit: "Bank" } )
    end

    it "resets journey" do
      expect(subject.journey).to eq( {entry: nil, exit: nil } )
    end

  end

end
