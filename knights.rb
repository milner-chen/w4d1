require_relative "./polytree.rb"

class KnightPathFinder
    attr_reader :root_node, :considered_positions
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        build_move_tree(root_node)
        @considered_positions = [pos]
        
    end

    def build_move_tree(root_node)
    end 

    def self.valid_moves(root_node)
        root_node.children 
    end 

    def new_move_positions(pos)
        @considered_positions.concat(KnightPathFinder.valid_moves(pos).select {|ele| !@considered_positions.include?(ele)})
    end 

    def inspect
        @value.inspect
    end 
end 

 kpf = KnightPathFinder.new([0, 0])
 p kpf.root_node

pos_1 = PolyTreeNode.new([1,0])
pos_2 = PolyTreeNode.new([0,1])
kpf.root_node.add_child(pos_1)
kpf.root_node.add_child(pos_2)
pos_1.parent = kpf.root_node
pos_2.parent = kpf.root_node

#  kpf.root_node
 KnightPathFinder.valid_moves(kpf.root_node)
p kpf.new_move_positions(kpf.root_node)
p kpf.considered_positions.each do |ele|
    p ele
end  

