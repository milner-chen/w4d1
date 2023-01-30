require_relative "./polytree.rb"

#no more .children 


class KnightPathFinder
    attr_reader :root_node, :considered_positions, :movements
   @@movements = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1,-2], [-1, 2], [-1, -1]]
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        build_move_tree(root_node)
        @considered_positions = [pos]
    end

    def build_move_tree(root_node)
        positions = []
        nodes = [root_node]
        until nodes.empty?
            node = nodes.shift
            positions << node.value  
            nodes.concat(node.children)
        end 
        return positions 
    end 
    def self.valid_moves(root_node) 
        pos = root_node.value
        moves = @@movements.map do |el|
            [pos[0] + el[0], pos[1] + el[1]] 
        end
        moves.select! do |indices|
            (indices[0] < 8 && indices[0] >= 0 ) && (indices[1] < 8 && indices[1] >= 0) 
        end
        moves
    end
  

    def new_move_positions(pos)
        new_moves = (KnightPathFinder.valid_moves(pos).select {|ele| !@considered_positions.include?(ele)})
        @considered_positions.concat(new_moves)
        return new_moves
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
p kpf.new_move_positions(kpf.root_node)
p kpf.considered_positions

# end  

# kpf.build_move_tree(kpf.root_node, kpf.)

# p KnightPathFinder.valid_moves(kpf.root_node)

#(2, 2)


 
