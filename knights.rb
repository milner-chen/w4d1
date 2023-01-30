require_relative "./polytree.rb"

class KnightPathFinder
    attr_reader :root_node
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        build_move_tree(root_node)
        @considered_positions = [pos]
    end

    def build_move_tree(root_node)
    end 

    def self.valid_moves(pos)
        moves = root_node.children 
    end 

    def new_move_positions(pos)
        @considered_positions.concat(self.valid_moves(pos).select {|ele| !@considered_positions.include?(ele)})
    end 
end 

p kpf = KnightPathFinder.new([0, 0])

pos_1 = PolyTreeNode.new([1,0])
pos_2 = PolyTreeNode.new([1,0])
kpf.root_node.add_child(pos_1)
kpf.root_node.add_child(pos_2)
pos_1.parent = kpf.root_node
pos_2.parent = kpf.root_node

p kpf.root_node
p KnightPathFinder.valid_moves([0, 0])