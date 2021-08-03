require_relative 'node'

class LinkedList
  attr_accessor :head
  def initialize
    @head = nil
  end

  def insert(data)
    new_node = Node.new(data: data, next_node: nil)
    
    unless @head
      @head = new_node
    else
      unless @head.next
        @head.next = new_node
      else
        last = find_last
        last.next = new_node
      end
    end
  end

  private
  def find_last
    list = @head
    while list
      return list unless list.next
      list = list.next
    end
  end
end