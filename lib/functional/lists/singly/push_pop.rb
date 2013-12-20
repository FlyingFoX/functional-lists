module Functional
  module Lists
    module Singly
      module PushPop

        def push(object)
          node = Node.new(object, nil)
          if @head.nil?
            @head, @tail = node, node
          else
            @tail.next = node
            @tail = node
          end
          @count += 1
          self
        end
        alias_method :<<, :push

        def pop
          node, to_pop = @head, @tail
          until node.nil?
            if node.next == to_pop
              @count -= 1
              @tail = node
              @tail.next = nil
            end
            node = node.next
          end
          to_pop.object if to_pop
        end
      end

    end
  end
end
