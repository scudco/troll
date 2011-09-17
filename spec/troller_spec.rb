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
end
