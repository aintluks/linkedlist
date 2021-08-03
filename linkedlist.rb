require_relative 'node'

class LinkedList
  attr_accessor :head, :length
  def initialize
    @head = nil
    @length = 0
  end

  def insert(data)
    new_node = Node.new(data: data, next_node: nil)
    @length += 1

    unless @head
      @head = new_node
    else
      last = find_last
      last.next = new_node
    end
  end

  def list_all
    list = @head
    result = []
    [] unless list
  
    while list
      result << list.data
      list = list.next
    end
    result
  end

  def delete(data)
    list = @head
    return @head = @head.next, @length -= 1 if @head.data == data
    
    while list
      begin return list.next = list.next.next, @length -= 1 if list.next.data == data
      rescue
        break
      end
      list = list.next
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