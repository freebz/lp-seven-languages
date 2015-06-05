class Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    @children = children
    @node_name = name
  end

  def visit_all(&block)
    visit &block
    children.each do |c| c.visit_all &block end
  end

  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new( "Ruby",
                      [Tree.new("Reia"),
                       Tree.new("MacRuby")] )

puts "Visiting a node"
ruby_tree.visit do |node| puts node.node_name end
puts

puts "visiting entire tree"
ruby_tree.visit_all do |node| puts node.node_name end
