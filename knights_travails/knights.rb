require_relative '00_tree_node.rb'

class KnightPathFinder
  
  attr_accessor :start_pos
  
  def initialize(root_node)
    @root_node = root_node
    @board = Array.new(8) {Array.new(8)}
  end
  
  def [](pos)
    x, y = pos
    @board[x][y]
  end
  
  def []=(pos, value)
    x, y = pos
    @board[x][y] = value
  end
    
  
end