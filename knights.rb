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
        @considered_positions.concat(self.valid_moves.select {|ele| !@considered_positions.include?(ele)})
    end 
end 