require 'station'

describe Station do
  it "returns a name" do
    subject = Station.new("Waterloo", 1)
    expect(subject.name).to eq "Waterloo"
  end
  
  it "returns a zone" do
    subject = Station.new("Waterloo", 1)
    expect(subject.zone).to eq 1
  end
end