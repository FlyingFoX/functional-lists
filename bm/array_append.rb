require 'benchmark'
require_relative '../lib/functional/lists/singly_linked'

Benchmark.measure {}

LinkedList = Functional::Lists::SinglyLinked

array = Array.new
list  = LinkedList.new

sample_obj = { size: 100000000 } 

[100, 1_000, 10_000, 100_000, 1_000_000, 10_000_000].each do |sample_size|
  sample_size.times { array.push sample_obj
                      list.push  sample_obj }

  Benchmark.bmbm do |x|
    array = x.report("array#push\t (#{sample_size})") { array.push sample_obj }
    list  = x.report("list#push \t (#{sample_size})") { array.push sample_obj }
    list - array
  end
end

