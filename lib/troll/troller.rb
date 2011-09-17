module Troll
  class Troller
    attr_accessor :file, :result

    def initialize(file_path=nil)
      self.file = file_path
      @trolls = [SemiColonTroll.new, TabTroll.new]
    end

    def troll
      contents = File.read(self.file)
      @trolls.each do |troll|
        contents = troll.troll_string(contents)
      end
      self.result = contents
    end

    def troll!
      troll
      write_file
    end

    private
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
