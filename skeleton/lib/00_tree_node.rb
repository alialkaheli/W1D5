class PolyTreeNode

    attr_accessor :value, :parent, :children
    
    def initialize (value)
      @value = value
      @parent = nil
      @children = []
    end
    
    def parent=(parent_node)
      return @parent = nil if parent_node == nil
      # this may mean the child wants to disown his parent
        
      if @parent != parent_node
        @parent.children.reject! {|node| node == self} if @parent != nil
        parent_node.children.push(self)
        @parent = parent_node
      end
    end
    
    def add_child(child_node)
      # receiver.add_child(child_node) 
      # this is going to append child_node to the receiver
      # child_node.parent = receiver
      
      child_node.parent = self      
    end
    
    def remove_child(child_node)
      # idx = self.children.index {|node| node == child_node} 
      # if idx == nil 
      #   raise_error "Error child not in parent" 
      # else
      #   self.children.reject! {|node| node == child_node} 
      # # Ask TA to confirm our thoughts; passed rspec, but still have doubts
      #   child_node.parent = nil
      # end
      
      if self.children.include?(child_node)
        self.children.reject! {|node| node == child_node} # parent to child perspective
        child_node.parent = nil # child to parent perspective  
      else
        raise_error "ERROR MESSAGE!"  
      end      
    end
  
  def dfs(target_value)
    return self if self.value == target_value
    self.children.each do |node|
      target = node.dfs(target_value)  # either going to return nil or a node 
      return target if target != nil  
    end
    return nil
  end
  
  
  # 
  # def bfs(target_value)
  #   queue_arr = []
  #   queue_arr << self
  #   until queue_arr.empty?
  #     return queue_arr.first if target_value == queue_arr.first.value 
  #     queue_arr << queue_arr.first.children unless queue_arr.first.children.empty?
  #     queue_arr.shift
  #     queue_arr.flatten!
  #   end 
  #   nil  
  # end  
  
  def bfs(target_value)
    queue_arr = [self]
  
    while true
      return queue_arr.first if queue_arr.first.value == target_value
      queue_arr += queue_arr.first.children
      queue_arr.shift
  
      break if queue_arr.length == 0
    end
  
    nil  
  end
  
end