require 'spec_helper'
require 'troll'

describe Troll::TabTroll do
  describe "#troll_string" do
    it "replace double spaces at the start of a string with a tab" do
      Troll::TabTroll.new.troll_string("       foo").should eql("			 foo")
    end
  end
end
