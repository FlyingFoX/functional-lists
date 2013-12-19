require 'benchmark'
require_relative '../lib/functional/lists/singly_linked'

class Character < Struct.new(:age, :first_name, :last_name, :race, :profession, 
                                 :strength, :intelligence, :wisdom, :constitution,
                                 :charisma, :luck)

end

LinkedList = Functional::Lists::SinglyLinked

COLLECTION_SIZE = 500_000

fake_name = -> {
  chars = ("a".."z").to_a
  rand(5..8).times.map { chars[rand(chars.size)] }.join()
}

fake_profession = -> {
  professions = %w(warrior thief cleric mage)
  professions[rand(professions.size)]
}

fake_race = -> {
  races = %w(human dwarf elf half-elf)
  races[rand(races.size)]
}

fake_character = -> {
  Character.new( age: rand(16..30), 
                 first_name: fake_name.(),
                 last_name: fake_name.(),
                 profession: fake_profession.(),
                 race: fake_race.()
               )
}

make_array = ->(n) { n.times.map { fake_character.() } }
make_list  = ->(n, list) { n.times.map { list.push fake_character.() } }


bm_array = -> {
  puts "working on building an array of #{COLLECTION_SIZE} items...."

  array = make_array.(COLLECTION_SIZE)

  Benchmark.bm do |bm|
    bm.report("1 thing added to an array of #{COLLECTION_SIZE} items") do
      array.push fake_character.()
    end
  end

  array = nil
}

bm_sll = -> {
  puts "working on building a singly linked list of #{COLLECTION_SIZE} items...."

  list = LinkedList.new
  list = make_list.(COLLECTION_SIZE, list)

  Benchmark.bm do |bm|
    bm.report("1 thing added to a list of #{COLLECTION_SIZE} items") do
      list.push fake_character.()
    end
  end
  
  list = nil
}


puts "\e[H\e[2J"

bm_sll.()

bm_array.()
