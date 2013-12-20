module Functional
  module Lists
    module Singly
      module UnshiftShift

        def unshift(object)
          node = Node.new(object, nil)
          if @head.nil?
            @head, @tail = node, node
          else
            @head.next = node
            @head = node
          end
          @count += 1
          self
        end

        def shift
          return unless @head
          to_shift = @head
          @head = to_shift.next if to_shift.next
          @count -= 1
          to_shift.object
        end
      end

    end
  end
end
