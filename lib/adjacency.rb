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
    @matrix.find_all do |edge|
      start, stop = edge
      start == node || stop == node
    end
  end

  def neighbors(node)
    @matrix.collect do |edge|
      start, stop = edge
      if start == node
        stop
      elsif stop == node
        start
      end
    end.compact
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
    # the stuff of nightmares...
    node1, node2 = [node1, node2].sort
    (self.neighbors(node1) + self.neighbors(node2)).uniq.collect do |node|
      self.find_edges(node).flatten
    end.flatten.each_slice(2).to_a.uniq.find_all do |edge|
      edge.first != node2
    end
  end

  private

  def first_order_path?(node1, node2)
    self.connected?(node1, node2)
  end

  def second_order_path?(node1, node2)
    node1_edges = self.find_edges(node1).first.last
    node2_edges = self.find_edges(node2).first.first
    node1_edges == node2_edges
  end

end
