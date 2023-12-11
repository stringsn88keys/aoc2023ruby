$:.unshift File.expand_path(File.dirname(__FILE__) + '/lib')

require 'colorize'

desc 'test'
task :test do
  $:.unshift File.expand_path(File.dirname(__FILE__) + '/')
  require 'test/unit'
  Dir.glob('test/*_test.rb').each { |file| require file }
end

desc 'results'
task :results do
  $:.unshift File.expand_path(File.dirname(__FILE__) + '/')
  25.times do |i|
    day = "%02d" % (i+1)
    puts "Day #{day}".colorize(color: :light_blue, background: :blue)
    day_class_string = "Day#{day}"
    next unless File.exist?("data/day#{day}.txt")
    input=App.load_input(day: i+1)
    next unless File.exist?("lib/day#{day}.rb")
    require "day#{day}"
    next unless Object.const_defined? day_class_string
    day_class=Object.const_get(day_class_string)
    day_instance=day_class.new(input)
    puts "part 1".light_blue
    puts day_instance.part1.light_white
    puts "part 2".light_blue
    puts day_instance.part2.light_white
  end
end

task default: %i[test results]
