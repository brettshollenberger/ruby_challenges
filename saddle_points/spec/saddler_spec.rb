# Write a program to search for the "saddle points" 
# in a 5 by 5 array of integers. A saddle point is a 
# cell whose value is greater than or equal to any in 
# its row, and less than or equal to any in its column. 
# There may be more than one saddle point in the array. 
# Print out the coordinates of any saddle points your 
# program finds. Print out "No saddle points" if 
# there are none.

require_relative "../lib/saddler"

describe "Saddler" do

  let(:map) {[
    [34, 21, 32, 41, 25],
    [14, 14, 15, 14, 14],
    [54, 45, 52, 42, 23],
    [33, 15, 51, 31, 35],
    [21, 52, 33, 13, 23]
  ]}

  let(:saddler) { Saddler.new(map) }

  it "loads a 5x5 array" do
    expect(saddler.map[0][0]).to eql(34)
    expect(saddler.map[4][4]).to eql(23)
  end

  it "can take coordinates" do
    expect(saddler.find_coordinates(1, 1)).to eql(34)
    expect(saddler.find_coordinates(5, 5)).to eql(23)
  end

  it "knows which numbers are in a particular row" do
    expect(saddler.row(1)).to eql([34, 21, 32, 41, 25])
    expect(saddler.row(5)).to eql([21, 52, 33, 13, 23])
    # Should raise_error has to be called on a proc
    lambda { saddler.row(6) }.should raise_error("Invalid row")
  end

  it "knows which numbers are in a particular column" do
    expect(saddler.column(1)).to eql([34, 14, 54, 33, 21])
    expect(saddler.column(5)).to eql([25, 14, 23, 35, 23])
    # Should raise_error has to be called on a proc
    lambda { saddler.column(6) }.should raise_error("Invalid column")
  end

  it "knows if a cell matches the row quality of a saddle point" do
    expect(saddler.saddleRow?(1, 4)).to eql(true)
    expect(saddler.saddleRow?(1, 3)).to eql(false)
  end

  it "knows if a cell matches the column quality of a saddle point" do
    expect(saddler.saddleColumn?(2, 3)).to eql(true)
    expect(saddler.saddleColumn?(1, 3)).to eql(false)
  end

  it "knows a saddle point" do
    expect(saddler.saddlePoint?(2, 3)).to eql(true)
    expect(saddler.saddlePoint?(1, 3)).to eql(false)
  end

  it "finds all saddle points" do
    expect(saddler.saddleUp).to eql([[2, 3]])
  end

  it "returns 'no saddle points' if no saddle points are found" do
    @map = [
      [34, 21, 32, 41, 25],
      [14, 14, 70, 14, 14],
      [54, 45, 52, 42, 23],
      [33, 15, 51, 31, 35],
      [21, 52, 33, 13, 23]
    ]
    @saddler = Saddler.new(@map)
    expect(@saddler.saddleUp).to eql("No saddle points")
  end
end
