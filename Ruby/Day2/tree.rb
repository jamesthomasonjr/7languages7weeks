class Tree
  attr_accessor :children, :node_name

  def initialize(name, structure)
    @node_name = name
    @children = []
    structure.each { |key, value| children.push(Tree.new(key, value)) }
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

new_tree = Tree.new('family', {
  'grandpa' => {
    'dad' => {
      'child 1' => {},
      'child 2' => {}
    },
    'uncle' => {
      'child 3' => {},
      'child 4' => {}
    }
  }
})

new_tree.visit_all {|node| puts node.node_name}
