# Do you like treasure hunts? 
# In this problem you are to write a program to 
# explore the above array for a treasure. 
# The values in the array are clues. 
# Each cell contains an integer between 11 and 55; 
# for each value the ten's digit represents the row 
# number and the unit's digit represents the column 
# number of the cell containing the next clue. 
# Starting in the upper left corner (at 1,1), 
# use the clues to guide your search of the array. 
# (The first three clues are 11, 34, 42). 
# The treasure is a cell whose value is the same as its coordinates. 
# Your program must first read in the treasure map data into a 5 by 5 array. 
# Your program should output the cells it visits during its search, 
# and a message indicating where you found the treasure.

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
