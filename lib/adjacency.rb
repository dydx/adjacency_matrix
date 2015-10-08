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
    if first_order_path?(node1, node2)
      [[node1, node2]]
    elsif second_order_path?(node1, node2)
      common = self.find_edges(node1).first
      [[node1, common], [common, node2]]
    end
  end

  private

  def first_order_path?(node1, node2)
    self.connected?(node1, node2)
  end

  def second_order_path?(node1, node2)
    node1_edges = self.find_edges(node1)
    node2_edges = self.find_edges(node2)
    node1_edges == node2_edges
  end

end
