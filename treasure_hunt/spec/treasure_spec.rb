require_relative '../lib/treasure'

describe "TreasureFinder" do

  let(:map) {[
    [34, 21, 32, 41, 25],
    [14, 42, 43, 14, 32],
    [54, 45, 52, 42, 23],
    [33, 15, 51, 31, 35],
    [21, 52, 33, 13, 23]
  ]}

  let(:start_position)  { 11 }

  let(:t)   { t = TreasureFinder.new(map, start_position) }

  it "takes a map object" do
    expect(t.map[0][0]).to eql(34)
    expect(t.map[4][4]).to eql(23)
  end

  it "solves the puzzle" do
    expect(t.solution).to eql(52)
  end

  it "stores each move" do
    expect(t.moves).to include(34, 42)
  end

end
