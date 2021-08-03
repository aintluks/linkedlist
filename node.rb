class Node
  attr_accessor :data, :next
  def initialize(data:, next_node:)
    @next = next_node
    @data = data
  end
end