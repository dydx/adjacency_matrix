class AdjacencyMatrix
  def initialize
    @matrix = []
  end

  def matrix
    @matrix
  end

  def add_edge(edge)
    if @matrix.include? edge
      nil
    else
      @matrix << edge
      @matrix.sort!
    end
  end

  def find_edges(node)
    edges = []
    @matrix.each do |edge|
      start, stop = edge
      if start == node
        edges << stop
      elsif  stop == node
        edges << start
      end
    end
    edges
  end

  def connected?(*nodes)
    connected = false
    @matrix.each do |edge|
      start, stop = edge
      if nodes.include? start
        if nodes.include? stop
          connected = true
        end
      end
    end
    connected
  end

  def path?(node1, node2)
    # maaad haxxx
    node1, node2 = [node1, node2].sort
    # check 1st paths
    if self.connected?(node1, node2)
      [[node1, node2]]
    else
      # find 2nd order paths
      node1_edges = self.find_edges(node1)
      node2_edges = self.find_edges(node2)
      if node1_edges == node2_edges
        [[node1, node1_edges.first], [node2_edges.first, node2]]
      end
    end
  end

end
