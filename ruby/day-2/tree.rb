class Tree
  attr_accessor :children, :node_name
  
  def initialize(node)
    @node_name = node.keys[0]
    @children = node[@node_name].keys.map do |key|
      Tree.new(key => node[@node_name][key])
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

# ruby_tree = Tree.new( "Ruby",
#   [Tree.new("Reia"),
#    Tree.new("MacRuby")] )
#
# puts "Visiting a node"
# ruby_tree.visit {|node| puts node.node_name}
# puts
#
# puts "visiting entire tree"
# ruby_tree.visit_all {|node| puts node.node_name}

ruby_tree = Tree.new(
  {'grandpa' => {
    'dad' => {'child 1' => {}, 'child 2' => {}},
    'uncle' => {'child 3' => {}, 'child 4' => {}}
  }})
ruby_tree.visit_all {|node| puts node.node_name}
