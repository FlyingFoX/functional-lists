require 'benchmark'
require_relative '../lib/functional/lists/singly_linked'

Benchmark.measure {}

LinkedList = Functional::Lists::SinglyLinked

array = Array.new
list  = LinkedList.new

sample_obj = { size: 100000000 } 

[100, 1_000, 10_000, 100_000, 1_000_000, 10_000_000].each do |sample_size|
  Benchmark.bmbm do |x|
    x.report("array#push\t (#{sample_size})") { array.push sample_obj }
    x.report("list#push \t (#{sample_size})") { list.push sample_obj }
  end

  Benchmark.bmbm do |x|
    x.report("array#push\t (#{sample_size})") { array.push sample_obj }
    x.report("list#push \t (#{sample_size})") { list.push sample_obj }
  end
end

