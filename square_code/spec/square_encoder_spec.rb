require_relative "../lib/square_encoder"

describe "SquareEncoder" do

  let(:msg) { "if man was meant to stay on the ground god would have given us roots" }

  let(:square_encoder) { SquareEncoder.new(msg) }

  it "counts a spaceless message" do
    expect(square_encoder.count).to eql(54)
  end

  it "defines the length of a line to best fit a square" do
    expect(square_encoder.line_length).to eql(8)
  end

  it "squares a message" do
    expect(square_encoder.square).to eql(["ifmanwas", "meanttos", "tayonthe", "groundgo", "dwouldha", "vegivenu", "sroots"])
  end

  it "returns the square message" do
    expect(square_encoder.square_message).to eql("imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn sseoau")
  end

end
