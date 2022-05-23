class Tree
  attr_accessor :children, :node_name
  
  def initialize(hash)
    if hash.length != 1
      raise ArgumentError.new("Expected hash with length 1, received: #{hash}")
    end

    @node_name = hash.keys[0]
    # iterate over key, value pairs
    @children = hash[@node_name].to_a.map do |child|
      Tree.new(child[0] => child[1])
    end
  end
  
  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end
  
  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new({'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } })

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
