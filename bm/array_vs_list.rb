require 'benchmark'
require_relative '../lib/functional/lists/singly_linked'

Character = Struct.new(:first, :last, :age, :profession, :race, :experiece)

A2Z = ("a".."z").to_a
fake_character =-> {
  Character.new(
    first: A2Z[rand(4..8)],
    last: A2Z[rand(4..8)],
    age: rand(16..38),
    profession: %w(warrior thief cleric mage).sample,
    race: %w(elf human troll dwarf).sample,
    experience: rand(0..3600000)
  )
}

LinkedList = Functional::Lists::SinglyLinked
SAMPLE_SIZES = [10_000, 100_000, 750_000]

# reset console term
puts "\e[H\e[2J"

SAMPLE_SIZES.each do |size|
  array = Array.new
  list  = LinkedList.new

  Benchmark.bm(24) do |x|
    x.report("#{size} => array#push")  { size.times do ; array.push fake_character.() ; end }
    x.report("#{size} => list#push" )  { size.times do ; list.push  fake_character.() ; end }
  end

end

# [ ] how long does it take to initialize empty collection
# [ ] how long does it take to initialize pre-sized collection
# [ ] how long does it take to add single item to empty list
# [x] how long does it take to add single item to pre-sized list
# [ ] how long does it take to add all items to collection
# [ ] how long do all steps take combined overall
