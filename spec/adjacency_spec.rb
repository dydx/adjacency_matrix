require_relative "../lib/adjacency"

describe AdjacencyMatrix do
  before(:each) do
    @matrix = AdjacencyMatrix.new
  end

  it "can be instantiated" do
    expect(AdjacencyMatrix).to receive(:new)
    AdjacencyMatrix.new
  end

  it "starts with an empty array" do
    expect(@matrix.matrix).to eql([])
  end

  it "can accept new edges" do
    edge = [1, 2]
    expect(@matrix.add_edge(edge)).to eql([edge])
  end

  it "can accept multiple new edges" do
    edge1 = [1,2]
    edge2 = [1,3]
    @matrix.add_edge(edge1)
    @matrix.add_edge(edge2)
    expect(@matrix.matrix).to eql([edge1, edge2])
  end

  it "rejects duplicate edges" do
    edge1 = [1,2]
    edge2 = [1,2]
    @matrix.add_edge(edge1)
    expect(@matrix.add_edge(edge2)).to be nil
  end

  it "can find edges for a given start node" do
    edge1 = [1,2]
    edge2 = [1,3]
    @matrix.add_edge(edge1)
    @matrix.add_edge(edge2)
    expect(@matrix.find_edges(1)).to eql([2,3])
    expect(@matrix.find_edges(2)).to eql([1])
    expect(@matrix.find_edges(3)).to eql([1])
  end

  it "can say if two nodes are connected" do
    edge1 = [1,2]
    edge2 = [1,3]
    @matrix.add_edge(edge1)
    @matrix.add_edge(edge2)
    expect(@matrix.connected?(1,2)).to be true
    expect(@matrix.connected?(2,3)).to be false
    expect(@matrix.connected?(2,1)).to be true
    expect(@matrix.connected?(3,1)).to be true
    expect(@matrix.connected?(3,2)).to be false
  end

  it "can say if three nodes are connected" do
    edge1 = [1,2]
    edge2 = [1,3]
    edge3 = [1,4]
    @matrix.add_edge(edge1)
    @matrix.add_edge(edge2)
    @matrix.add_edge(edge3)
    expect(@matrix.connected?(1,2,3)).to be true
    expect(@matrix.connected?(3,2,1)).to be true
    expect(@matrix.connected?(2,3,4)).to be false
    expect(@matrix.connected?(1,3,4)).to be true
    expect(@matrix.connected?(4,1,3)).to be true
    expect(@matrix.connected?(1,4,2)).to be true
  end

  it "can tell if there is a path between two nodes" do
    edge1 = [1,2]
    edge2 = [2,3]
    edge3 = [3,4]
    edge4 = [1,3]
    @matrix.add_edge(edge1)
    @matrix.add_edge(edge2)
    @matrix.add_edge(edge3)
    @matrix.add_edge(edge4)
    expect(@matrix.path?(1,2)).to eql([[1,2]])
    expect(@matrix.path?(1,3)).to eql([[1,3]])
    expect(@matrix.path?(1,4)).to eql([[1,3], [3,4]])
  end
end
