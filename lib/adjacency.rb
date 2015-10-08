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
    end
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
      common = self.find_edges(node1).first.last
      [[node1, common], [common, node2]]
    else
      node1_edges = self.find_edges(node1)
      node2_edges = self.find_edges(node2)
      puts
      puts "Node #{node1}'s Edges: #{node1_edges}"
      puts "Node #{node2}'s Edges: #{node2_edges}"
      puts "Checking edges of associated nodes"
      node1_edges.each do |edge|
        start, stop = edge
        puts "Checking Node #{node1} --------"
        puts "Node #{start}'s Edges: #{self.find_edges(start)}"
        puts "Node #{stop}'s Edges: #{self.find_edges(stop)}"
      end

      node2_edges.each do |edge|
        start, stop = edge
        puts "Checking Node #{node2} --------"
        puts "Node #{start}'s Edges: #{self.find_edges(start)}"
        puts "Node #{stop}'s Edges: #{self.find_edges(stop)}"
      end
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
