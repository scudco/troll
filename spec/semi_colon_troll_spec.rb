require 'spec_helper'
require 'troll'

describe Troll::SemiColonTroll do
  describe "#troll_string" do
    it "appends a semicolon to a single-line string" do
      Troll::SemiColonTroll.new.troll_string("foo").should eql("foo;")
    end

    it "does not append a semicolon to a single-line string ending in a semi-colon" do
      Troll::SemiColonTroll.new.troll_string("foo;").should eql("foo;")
    end

    it "does not append a semicolon to a single-line string ending in a comma" do
      Troll::SemiColonTroll.new.troll_string("foo,").should eql("foo,")
    end

    it "appends a semicolon to each line of a multi-line string" do
      multi_line_string = <<-EOS
        class Xzibit

          def yo_dawg_i_heard_you_like(&procs)
            Proc.new { procs.call }
          end

        end
      EOS
      semi_coloned_multi_line_string = <<-EOS
        class Xzibit;

          def yo_dawg_i_heard_you_like(&procs);
            Proc.new { procs.call };
          end;

        end;
      EOS
      Troll::SemiColonTroll.new.troll_string(multi_line_string).should eql(semi_coloned_multi_line_string)
    end
  end
end
