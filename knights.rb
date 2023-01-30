require_relative "./polytree.rb"

#no more .children 


class KnightPathFinder
    attr_reader :root_node, :considered_positions, :movements
   @@movements = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1,-2], [-1, 2], [-1, -1]]
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
        build_move_tree(root_node)
    end

    def build_move_tree(root_node)
        nodes = [root_node]
        until nodes.empty?
            node = nodes.shift 
            new_pos = (new_move_positions(node.value))
            new_pos.map! {|pos| PolyTreeNode.new(pos)} 
            p new_pos
            new_pos.each {|ele| ele.parent = node}
            nodes.concat(new_pos) 
            #iterate and turn into nodes #add as children to 'node' #parent= 
        end 
    end 

    def self.valid_moves(pos) 
        pos  #value
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

    def to_s
        @value
    end 
    
end 

 


p kpf = KnightPathFinder.new([0, 0])
p kpf.considered_positions.length 


#  p kpf.root_node

# pos_1 = PolyTreeNode.new([1,0])
# pos_2 = PolyTreeNode.new([0,1])
# kpf.root_node.add_child(pos_1)
# kpf.root_node.add_child(pos_2)
# pos_1.parent = kpf.root_node
# pos_2.parent = kpf.root_node

#  kpf.root_node
# p kpf.new_move_positions(kpf.root_node)
# p kpf.considered_positions


# end  

# kpf.build_move_tree(kpf.root_node, kpf.)

# p KnightPathFinder.valid_moves(kpf.root_node)

#(2, 2)


 
