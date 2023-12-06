$:.unshift File.expand_path(File.dirname(__FILE__) + '/lib')

desc 'test'
task :test do
  $:.unshift File.expand_path(File.dirname(__FILE__) + '/')
  require 'test/unit'
  Dir.glob('test/*_test.rb').each { |file| require file }
end
