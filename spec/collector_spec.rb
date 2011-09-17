require 'troll'

describe Troll::Collector do
  context "project path" do
    it "collects all ruby lib files" do
      collector = Troll::Collector.new("spec/fixtures/lulz")
      collector.files.should include("spec/fixtures/lulz/lib/lulz.rb","spec/fixtures/lulz/lib/lulz/foo.rb")
    end

    it "ignores all non-ruby lib files" do
      collector = Troll::Collector.new("spec/fixtures/lulz")
      collector.files.should_not include("spec/fixtures/lulz/config/stuff.yml","spec/fixtures/lulz/README.md", "spec/fixtures/lulz/lib/lulz/foo.c")
    end
  end
end
