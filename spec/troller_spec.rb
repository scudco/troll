require 'spec_helper'
require 'troll'

describe Troll::Troller do
  describe "#troll" do
    it "stores the troll result" do
      t = Troll::Troller.new("spec/fixtures/xzibit.rb")
      t.troll
      t.result.should eql(File.read("spec/fixtures/xzibit_trolled.rb"))
    end
  end

  describe "#troll!" do
    let(:troller) { Troll::Troller.new("spec/fixtures/xzibit.rb") }
    before do
      troller.stub(:output_file).and_return("spec/fixtures/xzibit_trolled_output.rb")
    end

    it "stores the troll result" do
      troller.troll!
      troller.result.should eql(File.read("spec/fixtures/xzibit_trolled.rb"))
    end

    it "rewrites the troll result to the file" do
      troller.troll!
      original = File.read("spec/fixtures/xzibit_trolled_output.rb")
      trolled  =  File.read("spec/fixtures/xzibit_trolled.rb")
      original.should eql(trolled)
    end
  end

  describe "#troll_string" do
    it "appends a semicolon to a single-line string" do
      Troll::Troller.new.troll_string("foo").should eql("foo;")
    end

    it "does not append a semicolon to a single-line string ending in a semi-colon" do
      Troll::Troller.new.troll_string("foo;").should eql("foo;")
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
      Troll::Troller.new.troll_string(multi_line_string).should eql(semi_coloned_multi_line_string)
    end
  end
end
