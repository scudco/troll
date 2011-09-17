module Troll
  class Troller
    attr_accessor :file, :result

    def initialize(file_path=nil)
      self.file = file_path
    end

    def troll
      contents = File.read(self.file)
      self.result = troll_string(contents)
    end

    def troll!
      troll
      write_file
    end

    def troll_string(str)
      result = ""
      str.each_line { |line| result += troll_line(line) }
      result
    end

    private
    def troll_line(line)
      case line
      when /^\s+$/
        line
      when /^.*;\s*$/
        line
      when /^.*\n$/
        "#{line.chomp};\n"
      else
        "#{line};"
      end
    end

    def write_file
      File.open(output_file, 'w') do |f|
        f.puts self.result
      end
    end

    def output_file
      self.file
    end
  end
end
