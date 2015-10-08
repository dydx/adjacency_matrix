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
    if self.connected?(node1, node2)
      [[node1, node2]]
    else
      @matrix.find_all do |edge|
        edge.first == node1 || edge.last == node2
      end
    end
  end

end
