class App
  def self.data_file_path(day:, suffix: "")
    File.expand_path(File.join(File.dirname(__FILE__), '..', 'data', "day#{'%02d' % day}#{suffix}.txt"))
  end
  def self.load_input(day:, suffix: "")
    File.readlines(data_file_path(day: day, suffix: suffix)).map(&:chomp)
  end
end
