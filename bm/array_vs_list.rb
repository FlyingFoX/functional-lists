require 'benchmark'
require_relative '../lib/functional/lists/singly_linked'

LinkedList = Functional::Lists::SinglyLinked

random  = Random.new(Time.now.to_i)
range   = (0..1000)
SAMPLE_SIZES = [1_000, 10_000, 100_000, 500_000, 1_000_000, 10_000_000]

# reset console term
puts "\e[H\e[2J"

SAMPLE_SIZES.each do |size|
  array = Array.new
  list  = LinkedList.new

  Benchmark.bm(15) do |x|
    x.report('array#push')  { size.times do ; array.push random.rand(range) ; end }
    x.report('list#push')   { size.times do ; list.push random.rand(range)  ; end }
    x.report('array#pop')   { size.times do ; array.pop  ; end }
    x.report('list#pop')    { size.times do ; list.pop   ; end }
  end

end

# [ ] how long does it take to initialize empty collection
# [ ] how long does it take to initialize pre-sized collection
# [ ] how long does it take to add single item to empty list
# [x] how long does it take to add single item to pre-sized list
# [ ] how long does it take to add all items to collection
# [ ] how long do all steps take combined overall
