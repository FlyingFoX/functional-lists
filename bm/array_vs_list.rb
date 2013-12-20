require 'benchmark'
require_relative '../lib/functional/lists/singly_linked'

Character = Struct.new(:age, :first_name, :last_name, :race, :profession, 
                       :strength, :intelligence, :wisdom, :constitution,
                       :charisma, :luck) do; end


LinkedList = Functional::Lists::SinglyLinked

COLLECTION_SIZE = 10_000
A2Z = ("a".."z").to_a

fake_name = -> {
  Array.new(A2Z).sample(rand(5..8)).join
}

fake_profession = -> {
  %w(warrior thief cleric mage).sample
}

fake_race = -> {
  %w(human dwarf elf half-elf).sample
}

fake_character = -> {
  Character.new( age: rand(16..30), 
                 first_name: fake_name.(),
                 last_name: fake_name.(),
                 profession: fake_profession.(),
                 race: fake_race.()
               )
}

make_list  = ->(n, list) { n.times.map { list.push fake_character.() } }


puts "\e[H\e[2J"
SAMPLE_SIZES = [1_000, 10_000, 100_000, 500_000, 1_000_000, 10_000_000]
Benchmark.bm do |bm|
  SAMPLE_SIZES.each do |size|
    # bm_sll.(bm, size)

    list = LinkedList.new
    
    # bm.report("#{size} list") do
    bm.report("List - build #{size}") do
      size.times { list.push fake_character.() }
    end


    # bm_array.(bm, size)
    # array = Array.new(size) { fake_character.() }
    array = Array.new
    bm.report("Array - build #{size}") do
      size.times { array.push fake_character.() }
    end
  end
end

# [ ] how long does it take to initialize empty collection
# [ ] how long does it take to initialize pre-sized collection
# [ ] how long does it take to add single item to empty list
# [x] how long does it take to add single item to pre-sized list
# [ ] how long does it take to add all items to collection
# [ ] how long do all steps take combined overall
