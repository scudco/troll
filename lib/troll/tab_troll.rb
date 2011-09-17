module Troll
  class TabTroll
    def troll_string(str)
      result = ""
      str.each_line {|line| result += line.gsub(/( {2})/, "	")}
      result
    end
  end
end
