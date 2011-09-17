module Troll
  class Collector
    attr_accessor :directory

    def initialize(dir)
      self.directory = dir
    end

    def files
      Dir["#{self.directory}/lib/**/*.rb"]
    end
  end
end
