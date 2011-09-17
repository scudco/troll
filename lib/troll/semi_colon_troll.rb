module Troll
  class SemiColonTroll
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

  end
end
