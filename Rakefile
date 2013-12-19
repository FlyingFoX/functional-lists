require 'rake/testtask'

desc "Open a console with the basic libs loaded"
task :console do
    sh "irb -rubygems -Ilib -r game.rb"
end

Rake::TestTask.new do |t|
    t.test_files = FileList['test/**/*_test.rb']
      t.libs = ["lib", "test"]
end

task :default => :test
