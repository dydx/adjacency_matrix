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

  # This currently only tells me if there is an edge between
  # n1 and n2 if the matrix contains [n1, n2]. This is basically
  # already solved with `connected?`.
  #
  # What I'd like is to be able to give it an n1 and an n2 that
  # are connected less directly, say, to find a path from 1 to 4
  # given:
  #   [(1,2), (2,3), (3,4), (1,3)]
  #
  # Was thinking about using the head and tail of the matrix and
  # then recursing over it, but there's a lot of edge cases that
  # misses
  def path?(node1, node2, path=[])
    @matrix.each do |edge|
      start, stop = edge
      if node1 == start && node2 == stop
        path << edge
      elsif node2 == start && node1 == stop
        path << edge
      end
    end
    path
  end

end
