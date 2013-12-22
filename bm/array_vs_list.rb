require 'benchmark'
require 'fileutils'

require_relative '../lib/functional/lists/singly_linked'

Character = Struct.new(:first, :last, :age, :profession, :race, :experiece) do; end

A2Z = ("a".."z").to_a

fake_character =-> {
  Character.new(
    A2Z.sample(8).join,
    A2Z.sample(8).join,
    rand(16..38),
    %w(warrior thief cleric mage).sample,
    %w(elf human troll dwarf).sample,
    rand(0..3600000)
  )
}

LinkedList = Functional::Lists::SinglyLinked

SAMPLE_SIZES = [10, 100, 100, 10_000, 100_000, 1_000_000]

delete_file = ->(filename) {
  File.delete(filename) if File.exist?(filename)
}

create_file = ->(filename) {
  FileUtils.touch(filename) unless File.exists?(filename)
}

resource_name = ->(collection) {
  collection.class.to_s.split("::").last.to_s.downcase
}

result_filename = ->(collection) {
  "benches/benchmark_#{resource_name.(collection)}.results"
}

prepare_result_file = ->(collection) {
  filename = result_filename.call(collection)
  delete_file.(filename)
  create_file.(filename)
  filename
}

write_results = ->(filename, json) {
  File.open(filename, "a") {|f| 
    f.write(json)
  }
}

mem_usage = -> { `ps -o rss= -p #{Process.pid}`.to_i }

sample_benchmark_result = ->(sample, collection) {
  { 
    sample_size: sample, cpu_time: Benchmark.measure {
      sample.times { collection.push(fake_character.()) }
    }.real, memory_usage: mem_usage.()
  }
}

benchmark = ->(collection) {
  puts "Benchmarking #{resource_name.(collection)} performance. This will take some time..."
  filename = prepare_result_file.(collection)
  json = { type: "#{collection.class}", operation: "#push", benchmarks: [] }
  json[:benchmarks] = SAMPLE_SIZES.map {|sample|
    puts "** Sample size of #{sample}"
    result = sample_benchmark_result.(sample, collection)
    puts "** #=> speed: #{result[:cpu_time]}, mem use: #{result[:memory_usage]}"
    result
  }
  write_results.(filename, json)
  json[:benchmarks]
}

win = -> {
  "\e[32mWINS\e[0m"
}.()

lose = -> {
  "\e[31mLOSES\e[0m"
}.()

list_samples  = benchmark.(LinkedList.new)
array_samples = benchmark.(Array.new)

list_samples.each.with_index do |list_sample, i|
  list_perf  = list_sample[:cpu_time].to_f
  array_perf = array_samples[i][:cpu_time].to_f
  list_mem   = list_sample[:memory_usage].to_i*1024
  array_mem  = array_samples[i][:memory_usage].to_i*1024

  puts "CPU: \t#{list_perf < array_perf ? win : lose}\t#{list_sample[:sample_size]}:\t\t"+
       "(List: #{list_perf} < Array: #{array_perf}"

  puts "MEM: \t#{list_mem < array_mem ? win : lose}\t#{list_sample[:sample_size]}:\t\t"+
       "(List: #{list_mem} < Array: #{array_mem}"
end
