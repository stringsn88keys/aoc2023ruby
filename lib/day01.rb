class Day01
  class << self
    def get_digits(input)
      input.gsub(/^\D*(\d).*$/, '\1') + input.gsub(/^.*(\d)\D*$/, '\1');
    end
  end
end
